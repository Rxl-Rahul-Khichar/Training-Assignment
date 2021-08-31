package com.rxlogix

class ResourceRating {
    Integer score
    static belongsTo = [resource:Resource,user:User]

    static constraints = {
        score blank: false
    }


}
