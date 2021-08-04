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
        Long topicId = t.id
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
            return  rsc
        } catch(Exception e){
            return null
        }
    }
    def uploadLinkMethod(params,name){
        User user = User.findByUserName(name)
        def t = Topic.findByTopicName(params.topicName)
        Long topicId = t.id
        String link = params.link
        LinkResource rsc = new LinkResource(description: params.description, topic: t, url: link)
        user.addToResources(rsc)
        t.addToResources(rsc)
        try {
            rsc.save(flush: true, failOnError: true)
            return  rsc
        } catch(Exception e){
            return null
        }
    }
    def resourceListMethod(tid){
        Topic topic = Topic.get(tid)
        List<Resource> rsc = Resource.createCriteria().list {
            eq("topic.id",tid)
        }
        return rsc
    }
    def recentResourceMethod(){
        List<Resource> rsc = Resource.createCriteria().list{
            'topic' {
                eq("visibility", VisibilityEnum.PUBLIC)
            }
        }
        Integer s =rsc.size()
        rsc.sort{
            x, y -> y.dateCreated <=> x.dateCreated
        }
        if(s>5){
            Integer t = s-5
            return rsc.dropRight(t)
        }
        else{
            return rsc
        }
    }
    def inboxResourceMethod(){
        List<Resource> inb = Resource.list()
        return  inb
    }

}
