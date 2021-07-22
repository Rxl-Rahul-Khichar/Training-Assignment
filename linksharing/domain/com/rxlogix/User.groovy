package com.rxlogix

class User {
    String email
    String userName
    String password
    String confirmPassword
    String firstName
    String lastName
    byte photo
    boolean admin
    Date dateCreated
    Date lastUpdated
    static transients = ['name']
    static hasMany = [topics:Topic,subscriptions:Subscription,resources:Resource,readingItems:ReadingItem,resourceratings:ResourceRating]

    static constraints = {
        email(unique: true, email: true)
        userName(unique: true, blank: false)
        firstName(blank: false,nullable: false)
        password(blank: false,nullable: false)

    }
    static mapping = {
        table 'usr'
    }
}
