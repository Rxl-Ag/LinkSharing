package com.rxlogix

class Subscription {

    Topic topic
    Users createdBy
//    Date dateCreate
    Seriousness seriousness

    static belongsTo = [createdBy:Users,topic:Topic]

    static constraints = {
        seriousness(nullable: false)
    }
    enum Seriousness{
        Serious,
        VerySerious,
        Casual
    }
}
