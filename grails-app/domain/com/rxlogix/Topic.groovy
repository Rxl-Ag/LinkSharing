package com.rxlogix

class Topic {
    String topicName;
    Users createdBy;
    Visibility visibility
    Date dateCreated
    Date lastUpdated
    static belongsTo = [createdBy: Users]
    static hasMany = [subscriptions: Subscription, resources: Resources]

    static constraints = {
        topicName(blank: false)
    }

    enum Visibility {
        Public,
        Private
    }
}
