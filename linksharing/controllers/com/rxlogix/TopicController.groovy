package com.rxlogix

import grails.converters.JSON

class TopicController {

        def topicService
        def subscriptionService
        def resourceService

    def addTopic(){
        String username = session.user.userName
        def t = topicService.createTopicMethod(params, username)
            List list=[]
            list.add(t)
            render(list as JSON)


            /*if(t){
                flash.messagetopic = "This Topic  already exist"
            }
            else{
                String username = session.user.userName
                def v = topicService.createTopicMethod(params, username)
                if(v) {
                    flash.success="Topic added"
                }
                else{
                    flash.error="topic not created"
                }
            }*/
    }
    def showTopicList(){
            List list = topicService.topicListMethod()
            render(view: 'topicList', model: [topicList: list])
    }
    def viewTopic(){
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
        render(view: "showTopic",
                model: [topic:topic, subs: sub, subscount: subsCount, postcount: postCount,subscriber:subList, resources: resourceList])
    }

}
