package com.rxlogix

import Enums.SeriousnessEnum
import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def subscriptions(String name) {
        User user = User.findByUserName(name)
        List subList = Subscription.createCriteria().list(max:5) {
            eq("user.id", user.id)
        }
        subList.sort{
           x, y -> y.topic.lastUpdated <=> x.topic.lastUpdated
        }
        return subList
    }
    def userSubList(name){
        List list  =User.findByUserName(name).subscriptions.asList()
        return list
    }


}
