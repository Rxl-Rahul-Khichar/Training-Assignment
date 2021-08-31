package com.rxlogix

import Enums.SeriousnessEnum

class SubscriptionController {
    def subscribe(params){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            User user = User.findByUserName(session.user.userName)
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

    }
    def unSubscribe(params){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            User user = User.findByUserName(session.user.userName)
            Subscription s = Subscription.findById(params.id)
            s.delete(flush: true)
            if (params.page == "dashboard") {
                redirect(controller: "dashboard", action: "dashboard")
            } else if (params.page == "topic") {
                redirect(controller: "Topic", action: "viewTopic", params: [id: params.id])
            }
        }
    }
    def unSubTrend(params){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            User user = User.findByUserName(session.user.userName)
            Long topid = Long.parseLong(params.id)
            Subscription sub = Subscription.createCriteria().get {
                eq('topic.id', topid)
                eq('user.id', user.id)
            }
            Subscription s = Subscription.findById(sub.id)
            s.delete(flush: true)
            if (params.page == "dashboard") {
                redirect(controller: "dashboard", action: "dashboard")
            } else if (params.page == "topic") {
                redirect(controller: "Topic", action: "viewTopic", params: [id: params.id])
            }
        }

    }
    def sendSubscriptionInvite() {
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            Long topid = Long.parseLong(params.id)
            User user = User.findByEmail(params.email)
            Topic topic = Topic.get(topid)
            Subscription sub = Subscription.findByTopicAndUser(topic, user)
            if (session.user.userName != user.userName) {
                flash.message = "Login as ${user.firstName}"
                redirect(controller:"user",actionName:"index")
                session.invalidate()
            } else {
                if (sub == null) {
                    Subscription sub1 = new Subscription(seriousness: "CASUAL")
                    topic.addToSubscribers(sub1)
                    user.addToSubscriptions(sub1)
                    topic.save(flush: true)
                    user.save(flush: true, failOnError: true)
                    sub1.save(flush: true, failOnError: true)
                    flash.message2 = "Subscribed successfully"
                    redirect(controller: 'dashboard', action: 'dashboard')
                } else {
                    flash.message2 = "You are already subscribed to this topic !!!"
                    redirect(controller: 'dashboard', action: 'dashboard')
                }
            }
        }
    }
    def changeSeriousness() {
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            Subscription subscription = Subscription.get(params.id)
            if (subscription) {
                subscription.seriousness = params.seriousness
                try {
                    subscription.save(flush: true, failOnerror: true)
                } catch (Exception e) {
                    flash.error = "error"
                }
                redirect(controller: "dashboard", action: "dashboard")
            } else {
                User u = User.findByUserName(session.user.userName)
                Topic t = Topic.findById(params.id)
                Subscription sub = Subscription.findByUserAndTopic(u, t)
                sub.seriousness = params.seriousness
                try {
                    sub.save(flush: true, failOnerror: true)
                } catch (Exception e) {
                    flash.error = "error"
                }
                redirect(controller: "dashboard", action: "dashboard")

            }
        }
    }

    def changeVisibility() {
        if (!session.user) {
            flash.mess = "login first"
            redirect(controller: "user", actionName: "index")
        }
        else {
            Topic topic = Topic.get(params.id1)
            topic.visibility = params.visibility
            try {
                topic.save(flush: true, failOnerror: true)
            } catch (Exception e) {
                flash.error = "error"
            }
            redirect(controller: "dashboard", action: "dashboard")
        }
    }
}
