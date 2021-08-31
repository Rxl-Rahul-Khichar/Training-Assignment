package com.rxlogix

class User {
    String email
    String userName
    String password
    String confirmPassword
    String firstName
    String lastName
    String photo
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated
    static transients = ['name']
    static hasMany = [topics:Topic,subscriptions:Subscription,resources:Resource,readingItems:ReadingItem,resourceratings:ResourceRating]

    static constraints = {
        email(unique: true, email: true)
        userName(unique: true, blank: false)
        firstName(blank: false,nullable: false)
        lastName(blank: true,nullable: true)
        password(blank: false,nullable: false)
        confirmPassword(blank: false,nullable: false)
        photo(blank: true,nullable: true)

    }
    static mapping = {
        table 'usr'
    }
}
