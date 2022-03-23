package com.rxlogix

class LinkResource {

    String url
    static belongsTo = [resource:Resources]

    static constraints = {
        url(blank: false)
    }
}
