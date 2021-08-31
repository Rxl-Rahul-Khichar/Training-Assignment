package com.rxlogix

import grails.converters.JSON

class TopicController {

        def topicService
        def subscriptionService
        def resourceService

    def addTopic(){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            String username = session.user.userName
            String name = params.topicName
            Topic topic = Topic.findByTopicName(name)
            User u = User.findByUserName(username)
            List list = []
            def top = User.findByUserName(username).topics.asList()
            if (top.contains(topic)) {
                flash.exist = "this topic already exist"
                list.add(flash.exist)
            } else {
                def t = topicService.createTopicMethod(params, username)
                flash.success = "topic added successfully"
                list.add(flash.success)

            }
            render(list as JSON)
        }
    }
    def showTopicList(){
            List list = topicService.topicListMethod()
            render(view: 'topicList', model: [topicList: list])
    }
    def viewTopic() {
        if (!session.user) {
            Long tid
            Long id = Long.parseLong(params.id)
            Subscription sub = Subscription.get(id)
            if (sub) {
                Topic t = sub.topic
                tid = t.id
            } else {
                tid = id
            }
            Topic topic = Topic.findById(tid)
            Integer subsCount = topic.subscribers.size()
            Integer postCount = topic.resources.size()
            //List topicSubList = subscriptionService.subscriptions(session.user.userName)
            List subList = resourceService.subscribersList(tid)
            List resourceList = resourceService.resourceListMethod(tid)
            render(view: "showTopic",
                    model: [topic: topic, subs: sub, subscount: subsCount, postcount: postCount,subscriber: subList, resources: resourceList])
        } else {
            //User user = User.findByUserName(session.user.userName)
            Long tid
            Long id = Long.parseLong(params.id)
            Subscription sub = Subscription.get(id)
            if (sub) {
                Topic t = sub.topic
                tid = t.id
            } else {
                tid = id
            }
            Topic topic = Topic.findById(tid)
            Integer subsCount = topic.subscribers.size()
            Integer postCount = topic.resources.size()
            //List topicSubList = subscriptionService.subscriptions(session.user.userName)
            List subList = resourceService.subscribersList(tid)
            List resourceList = resourceService.resourceListMethod(tid)
            List subsList = subscriptionService.subscriptions(session.user.userName)
            render(view: "showTopic",
                    model: [topic: topic, subs: sub, subscount: subsCount, postcount: postCount,subscription:subsList ,subscriber: subList, resources: resourceList])
        }
    }
    def editTopic(){
        Topic topic = Topic.findById(params.id)
        println topic
        topic.topicName = params.topicName
        topic.save(flush:true,failOnError:true)
        redirect url: "/"
    }
    def deleteTopic(){
        Topic topic = Topic.findById(params.id)
        topic.delete(flush:true)
        redirect url: "/"
    }

}
