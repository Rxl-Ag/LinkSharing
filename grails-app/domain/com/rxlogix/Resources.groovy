package com.rxlogix

class Resources {
    String description
    Users createdBy
    Topic topics
    Date dateCreate
    Date lastUpdate

    static hasMany = [readingitem:ReadingItem, rating:ResourceRating]
    static belongsTo = [topics:Topic]

    static constraints = {
        description blank: false
    }
}
