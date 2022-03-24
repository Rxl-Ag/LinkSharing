package com.rxlogix

class Resources {
    String description
    Users createdBy
    Topic topics
    Date dateCreated
    Date lastUpdated

    static hasMany = [readingitem:ReadingItem, rating:ResourceRating]
    static belongsTo = [topics:Topic]

    static constraints = {
        description blank: false
    }
}
