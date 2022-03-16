package com.rxlogix

class Document {

    String filePath
    static hasMany = [resource:Resources]

    static constraints = {
        filePath(blank: false)
    }
}
