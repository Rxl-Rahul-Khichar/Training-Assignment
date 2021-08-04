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
           x, y -> y.lastUpdated <=> x.lastUpdated
        }
        return subList
    }
    def topicSubscriptions(tid) {
        List<Subscription> subList = Subscription.createCriteria().list {
            eq("topic.id", tid)
        }
        return subList
    }

}
