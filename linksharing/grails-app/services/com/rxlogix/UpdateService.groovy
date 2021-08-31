package com.rxlogix

import grails.gorm.transactions.Transactional

@Transactional
class UpdateService {

    def updateProfile(params,request, String name) {
            User user =User.findByUserName(name)
            user.userName = params.userName
            user.firstName = params.firstName
            user.lastName = params.lastName
        def file1 = request.getFile('image1')
        if(file1 && !file1.empty){
            File photo2= new File("/home/rxlogix/IdeaProjects/demo/grails-app/assets/images/profile/${user.userName}.jpg")
            file1.transferTo(photo2)
            // println(photo2.path)
            user.photo="/profile/${user.userName}.jpg"
            //println u1.photo
        }
        try{
            user.save(flush:true,failOnError:true)
            return user
        } catch(Exception e){
            return  null
        }
    }
    def updatePassword(params, String name){

            User user = User.findByUserName(name)
            user.password = params.newPassword
        try {
            user.save(failOnError: true, flush: true)
            return user
        } catch(Exception e){
            return null
        }
    }
}

