package com.rxlogix

import Enums.VisibilityEnum
import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class ResourceService {

    def serviceMethod() {
    }
    def uploadDocumentMethod(params, request, name) {
        User user = User.findByUserName(name)
        def t = Topic.findByTopicName(params.topicName)
        MultipartFile doc = request.getFile('document')
        String fName = doc.getOriginalFilename()
        String fPath = "/home/rxlogix/IdeaProjects/demo/grails-app/assets/documents/" + user.userName + fName
        File file= new File(fPath)
        doc.transferTo(file)
        Resource rsc = new DocumentResource(description: params.description, topic: t, filePath: fPath, createdBy:user)
        user.addToResources(rsc)
        t.addToResources(rsc)
        try {
            rsc.save(flush: true, failOnError: true)
            List subscriberList = subscribersList(t.id)
            addToUnreadItem(subscriberList, rsc)
            return  rsc
        } catch(Exception e){
            return null
        }
    }
    def uploadLinkMethod(params,name){
        User user = User.findByUserName(name)
        def t = Topic.findByTopicName(params.topicName)
        String link = params.link
        LinkResource rsc = new LinkResource(description: params.description, topic: t, url: link)
        user.addToResources(rsc)
        t.addToResources(rsc)
        try {
            rsc.save(flush: true, failOnError: true)
            List subscriberList = subscribersList(t.id)
            addToUnreadItem(subscriberList, rsc)
            return rsc
        } catch(Exception e){
            println e
            return null
        }
    }
    def resourceListMethod(tid){
        List<Resource> rsc = Resource.createCriteria().list {
            eq("topic.id",tid)
        }
        return rsc
    }
    def recentResourceMethod(){
        List<Resource> rsc = Resource.createCriteria().list(){
            'topic' {
                eq("visibility", VisibilityEnum.PUBLIC)
            }
        }
        Integer s =rsc.size()
        rsc.sort{
            x, y -> y.dateCreated <=> x.dateCreated
        }
        /*if(s>2){

            return rsc.subList(0,2)
        }
        else{
            return rsc
        }*/
        return  rsc
    }
    def inboxResourceMethod(){
        List<Resource> inb = Resource.list()
        return  inb
    }
    def inboxListMethod(name){
        User user = User.findByUserName(name)
        List unList = ReadingItem.createCriteria().list() {
            eq('isRead',false)
            eq("user.id", user.id)
        }
        //unList.sort{
           // x,y -> y.dateCreated <=> x.dateCreated
        //}
        return unList
    }
    def subscribersList(topicId) {
        List userIds = Subscription.createCriteria().list() {
            eq('topic.id', topicId)
        }
        return userIds
    }
    def userResourceList(name){
        List list = User.findByUserName(name).resources.asList()
        return  list
    }
    def addToUnreadItem(subscriberList, newResource) {
        Boolean isRead = false
        subscriberList.each {
            User us = it.user
            ReadingItem readItem = new ReadingItem(isRead: isRead, resource: newResource, user: us)
            try {
                readItem.save(failOnError: true, flush: true)
                try {
                    us.addToReadingItems(readItem)
                    newResource.addToReadingItem(readItem)
                    us.save(flush: true, failOnError: true)
                    newResource.save(flush: true, failOnError: true)
                }
                catch (Exception e){
                    return null
                }
            } catch (Exception e){
                return null
            }
        }
    }
    def avgRating(rid){
        List rating  = ResourceRating.createCriteria().list() {
            eq("resource.id",rid)
        }
    }
    List<Resource> postList(){
        Map<Integer,Integer> mp =[:]
        List<Resource> rscList = Resource.list()
        rscList.each {
            Resource rsc = Resource.findById(it.id)
            if (rsc.topic.visibility.equals(VisibilityEnum.PUBLIC)) {
            if(ResourceRating.findByResource(rsc)) {
                    Long l = ResourceRating.createCriteria().get {
                        projections {
                            avg("score")
                        }
                        eq("resource", rsc)
                    }
                    mp[it.id] = l
                }
            }

        }
        mp = mp.sort {it.value}
        List<Resource> m = []
        Set<Integer> s = mp.keySet()
        for(int i=0;i<s.size();i++)
        {
            m.add(Resource.findById(s[i]))
        }
        m = m.reverse()
        if(m.size()>5)
        {
            m=m.subList(0,5)
        }
        return m
    }
    def sumRating(id){
        Resource rsc = Resource.findById(id)
        Long sum = ResourceRating.createCriteria().get {
            projections {
                avg("score")
            }
            eq("resource", rsc)
        }
        return sum
    }

}
