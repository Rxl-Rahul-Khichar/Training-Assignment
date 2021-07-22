package com.rxlogix
//import Enums.SeriousnessEnum
class Subscription {
//topic
    //user
    //enm seriousness
    Date dateCreated
    //SeriousnessEnum seriousness
    static belongsTo = [user:User,topic:Topic]
    static constraints = {
    }
}
