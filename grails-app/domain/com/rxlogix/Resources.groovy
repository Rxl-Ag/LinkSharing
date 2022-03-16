package com.rxlogix

class Resources {
    String description
    Users createdBy
    Topic topic
    Date dateCreate
    Date lastUpdate

    static hasMany = [readingitem:ReadingItem, rating:ResourceRating]
    static belongsTo = [topic:Topic]

    static constraints = {
        description blank: false
    }
}
