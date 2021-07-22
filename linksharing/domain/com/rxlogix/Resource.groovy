package com.rxlogix

class Resource {
    String description
    Date dateCreated
    Date lastUpdated
    static belongsTo = [createdBy:User,topic:Topic]
    static constraints = {

    }
    static mapping = {
        table 'rsc'
    }
}
