package com.rxlogix

import grails.converters.JSON

class ResourceRatingController {

    def index() { }
    def resourceRating(){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            int rating = Integer.parseInt(params.value)
            User user = User.findByUserName(session.user.userName)
            Long rid = Long.parseLong(params.id)
            Resource resource = Resource.get(rid)
            ResourceRating resourceRating = ResourceRating.createCriteria().get {
                eq('user.id', user.id)
                eq('resource.id', resource.id)
            }
            if (resourceRating) {
                resourceRating.score = rating
                resourceRating.save(flush: true, failOnError: true)
            } else {
                ResourceRating resourceRate = new ResourceRating(score: rating)
                resource.addToResourceRated(resourceRate)
                user.addToResourceratings(resourceRate)
                user.save(flush: true, failOnError: true)
                resource.addToResourceRated(resourceRate)
                resource.save(flush: true, failOnError: true)
                resourceRate.save(flush: true, failOnError: true)
            }
            render([success: true] as JSON)
        }
    }
}
