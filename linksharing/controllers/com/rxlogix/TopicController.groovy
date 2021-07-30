package com.rxlogix

class TopicController {

        def topicService

        def addTopic(){
            Topic t = Topic.findByTopicName(params.topicName)
            if(t){
                flash.messagetopic = "This Topic  already exist"
                redirect(controller: 'dashboard', action: 'dashboard')
            }
            else{
                String username = session.name
                def v = topicService.createTopicMethod(params, username)
                if(v) {
                    redirect(controller: "dashboard", actionName: "dashboard")
                    flash.success="Topic added"
                }
                else{
                    flash.error="topic not created"
                }
            }
        }
}
