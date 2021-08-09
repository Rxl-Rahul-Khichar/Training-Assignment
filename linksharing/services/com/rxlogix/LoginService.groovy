package com.rxlogix

import grails.gorm.transactions.Transactional

@Transactional
class LoginService {

    def loginMethod(params, def request) {
    User user= User.findByUserName(params.userName)
        if(params.password==null || params.userName==null || !user || !user.isActive()){
                return null
        }
        else if(user.userName==params.userName){
            return user
        }
        else{
            return null
        }
    }
}
