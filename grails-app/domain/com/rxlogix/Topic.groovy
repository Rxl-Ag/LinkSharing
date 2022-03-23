package com.rxlogix

class Topic {
    String topicName;
    Users createdBy;
    Visibility visibility
    Date datecreate
    Date lastupdate
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
