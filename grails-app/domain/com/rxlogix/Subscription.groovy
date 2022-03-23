package com.rxlogix

class Subscription {

    Topic topics
    Users createdBy
    Date datecreate
    Seriousness seriousness

    static belongsTo = [createdBy:Users,topics:Topic]

    static constraints = {
        seriousness(nullable: false)
    }
    enum Seriousness{
        Serious,
        VerySerious,
        Casual
    }
}
