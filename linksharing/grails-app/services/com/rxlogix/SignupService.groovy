package com.rxlogix

import grails.gorm.transactions.Transactional

import java.nio.channels.ScatteringByteChannel

@Transactional
class SignupService {

    def signupMethod( Map params , def request) {
            User userRegister = new User(params)
            userRegister.active = true
            def file = request.getFile('image')
            if(file && !file.empty){
                File photo1= new File("/home/rxlogix/IdeaProjects/demo/grails-app/assets/images/profile/${params.userName}.jpg")
                file.transferTo(photo1)
               // println(photo1.path)
                userRegister.photo="/profile/${params.userName}.jpg"
                //println userRegister.photo

            }
            else{
                userRegister.photo= "/profile/default.png"
            }
            try{
                userRegister.save(flush:true,failOnError:true)
                if(userRegister.id==1){
                    userRegister.admin=true
                    userRegister.save(flush:true,failOnError:true)
                }
                return userRegister
            } catch(Exception e){
                return  null
            }

    }
}
