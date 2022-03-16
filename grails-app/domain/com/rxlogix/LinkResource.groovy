package com.rxlogix

class LinkResource {

    String url
    static hasMany = [resource:Resources]

    static constraints = {
        url(blank: false, url: true)
    }
}
