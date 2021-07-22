package com.rxlogix

class ReadingItem {
// resource
    //user
    boolean isRead
    static belongsTo = [resource:Resource,user:User]

    static constraints = {
        isRead blank: false
    }
}
