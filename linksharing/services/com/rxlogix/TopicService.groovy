package com.rxlogix

import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    def createTopicMethod(Map params,username) {
        User user = User.findByUserName(username)
        Topic topic = new Topic(params)
        user.addToTopics(topic)

        if (topic.validate()) {
            topic.save(failOnError: true, flush: true)
            user.save(flush: true)
            return topic
        } else {
            topic.errors.getAllErrors()
            return null
        }
    }


}
