package com.rxlogix

class ReadingItem {

    Resources resource
    Users usr
    Boolean isRead

    static belongsTo = [resource: Resources, usr: Users ]
    static constraints = {

    }
}
