package com.rxlogix

class Document {

    String filePath
    static belongsTo = [resource:Resources]

    static constraints = {
        filePath(blank: false)
    }
}
