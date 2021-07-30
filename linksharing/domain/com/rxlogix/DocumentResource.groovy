package com.rxlogix

class DocumentResource {
    String filePath
    static belongsTo = [resource: Resource]

    static constraints = {
        filePath blank: false
    }
    static mapping = {
        table 'DocRes'
    }
}
