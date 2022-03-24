package com.rxlogix

class Users {

    String email
    String username
    String password
    String confirmpassword
    String firstname
    String lastname
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
    String userImage

    static hasMany = [topics:Topic, subs:Subscription, resource:Resources, readingitem:ReadingItem]

    static constraints = {
        email(unique: true, email: true, blank: false)
        username(unique: true, blank: false)
        password(minSize: 4, blank: false)
        firstname(blank: false)
        lastname(blank: false)
        admin(nullable: true)
        active(nullable: true)
        confirmpassword(blank: false)
//        userImage(blank: true, nullable: true, maxSize:1073741824)
        userImage nullable: true
    }
}
