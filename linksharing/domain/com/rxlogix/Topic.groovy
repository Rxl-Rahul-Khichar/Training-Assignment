package com.rxlogix
//import Enums.VisibilityEnum
class Topic {
    String name
    Date dateCreated
    Date lastUpdated
    //VisibilityEnum visibility
    static belongsTo = [createdBy:User]
    static hasMany = [resources:Resource,subscribers:Subscription]
    static constraints = {
        name blank: false
    }
}
