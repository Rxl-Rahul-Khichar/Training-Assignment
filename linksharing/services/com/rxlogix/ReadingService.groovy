package com.rxlogix

import grails.gorm.transactions.Transactional

@Transactional
class ReadingService {

    def serviceMethod() {
    }
    def markAsReadMethod(params,name){
        Long resId = Long.parseLong(params.rid)
        User user = User.findByUserName(name)
        ReadingItem readItem = ReadingItem.createCriteria().get {
            eq('resource.id', resId)
            eq('user.id', user.id)
        }
        readItem.isRead = true
        readItem.save(flush: true)
    }
}
