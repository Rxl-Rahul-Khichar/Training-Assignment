package com.rxlogix

import grails.gorm.transactions.Transactional

@Transactional
class UserListService {

    def listMethod() {
        List userList = User.list()
        return userList
    }
}
