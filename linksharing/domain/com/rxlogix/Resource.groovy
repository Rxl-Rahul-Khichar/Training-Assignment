package com.rxlogix

class Resource {
    String description
    Date dateCreated
    Date lastUpdated
    static belongsTo = [createdBy:User,topic:Topic]
    static hasMany = [readingItem: ReadingItem, resourceRated: ResourceRating]
    static constraints = {

    }
    static mapping = {
        table 'rsc'
    }
}
class LinkResource extends Resource {
    String url
}
class DocumentResource extends Resource {
    String filePath
}
