package com.rxlogix

import Enums.SeriousnessEnum
import Enums.VisibilityEnum
import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    def createTopicMethod(Map params,username) {
        User user = User.findByUserName(username)
        Topic topic = new Topic(params)
        user.addToTopics(topic)

        try{
            topic.save(failOnError: true, flush: true)
            user.save(flush: true)
            Subscription subscription = new Subscription(seriousness: SeriousnessEnum.VERY_SERIOUS)
            user.addToSubscriptions(subscription)
            topic.addToSubscribers(subscription)
            try {
                subscription.save(failOnError: true, flush: true)
            } catch(Exception e) {
                return null
            }
            println topic
            return topic

        } catch(Exception e){
            return null
        }

    }
    def topicListMethod(){
        List<Topic> topicList = Topic.list()
        return topicList
    }
    def userTopicCountMethod(String name){
        Integer utc = User.findByUserName(name).topics.size()
        return utc
    }
    def userSubCountMethod( String name) {
        Integer usc = User.findByUserName(name).subscriptions.size()
        return usc
    }
    def trendTopicsMethod() {
        List<Topic> trendList = Topic.createCriteria().list() {
            eq('visibility', VisibilityEnum.PUBLIC)
        }
        Integer s =trendList.size()
        trendList.sort{
            x, y -> y.resources.size() <=> x.resources.size()
        }
        if(s>5){
            Integer t = s-5
            return trendList.dropRight(t)
        }
        else{
            return trendList
        }
    }
    def userTopicList(String name){
        List list = User.findByUserName(name).topics.asList()
        return  list
    }
    def userSubsList(String name) {
        List list = Topic.findByTopicName(name).subscribers.asList()

        return list
    }
}
