package com.rxlogix
import Enums.SeriousnessEnum
class Subscription {
//topic
    Date dateCreated
    Date lastUpdated
    SeriousnessEnum seriousness
    static belongsTo = [user:User,topic:Topic]
    static constraints = {
    }
}
