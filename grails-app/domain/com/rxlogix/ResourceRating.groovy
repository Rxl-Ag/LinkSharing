package com.rxlogix

class ResourceRating {

    Resources resource
    Users usr
    Integer score

    static belongsTo = [usr:Users, resource:Resources]
    static constraints = {
        score(nullable: false)
    }
}
