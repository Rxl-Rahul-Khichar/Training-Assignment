package com.rxlogix

class LinkResource {
    String url
    static belongsTo = [resource: Resource]

    static constraints = {
        url blank: false
    }

    static mapping = {
        table 'LinkRes'
    }
}
