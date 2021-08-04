package com.rxlogix

import Enums.SeriousnessEnum

class SubscriptionController {
    def subscribe(params){
        User user= User.findByUserName(session.user.userName)
        Topic topic = Topic.get(params.id)
        Subscription subs = new Subscription(seriousness: SeriousnessEnum.CASUAL, topic: topic)
        topic.addToSubscribers(subs)
        user.addToSubscriptions(subs)
        subs.save(flush: true, failOnError: true)
        user.save(flush: true, failOnError: true)
        if (params.page == "dashboard") {
            redirect(controller: "dashboard", action: "dashboard")
        } else if (params.page == "topic") {
            redirect(controller: "Topic", action: "viewTopic", params: [id: params.id])
        }

    }
    def unSubscribe(params){
        User user = User.findByUserName(session.user.userName)
        Subscription s = Subscription.findById(params.id)
        s.delete(flush: true)
        if (params.page == "dashboard") {
            redirect(controller: "dashboard", action: "dashboard")
        } else if (params.page == "topic") {
            redirect(controller: "Topic", action: "viewTopic", params: [id: params.id])
        }
    }
    def unSubTrend(params){
        User user = User.findByUserName(session.user.userName)
        Long topid = Long.parseLong(params.id)
        Subscription sub = Subscription.createCriteria().get {
            eq('topic.id', topid)
            eq('user.id', user.id)
        }
        println sub.id
        Subscription s = Subscription.findById(sub.id)
        s.delete(flush:true)
        if (params.page == "dashboard") {
            redirect(controller: "dashboard", action: "dashboard")
        } else if (params.page == "topic") {
            redirect(controller: "Topic", action: "viewTopic", params: [id: params.id])
        }

    }
}
