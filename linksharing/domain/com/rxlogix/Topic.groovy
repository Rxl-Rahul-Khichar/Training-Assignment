package com.rxlogix
import Enums.VisibilityEnum
class Topic {
    String topicName
    Date dateCreated
    Date lastUpdated
    User createdBy
    VisibilityEnum visibility
    static belongsTo = [createdBy:User]
    static hasMany = [resources:Resource,subscribers:Subscription]
    static constraints = {
        topicName blank: false
    }
}
