package com.rxlogix

class UserController {
    def loginService
    def signupService
    def userListService
    def topicService
    def updateService
    def resourceService
    def subscriptionService
    def index() {
        /*def recentPagination = [max: params.max, offset: params.offset]
        session.recentPagination = recentPagination*/
        Date date =new Date()
        List rsc = resourceService.recentResourceMethod()
        List top = resourceService.postList()
        /*params.offset = 0
        params.max = 2*/
        render(view: "index",model: [resource:rsc,date:date,top:top])
    }
    def registerUser() {
        if (User.findByEmail(params.email)) {
            flash.message2 = "Email is used"
            redirect(actionName: "index")
        } else if (User.findByUserName(params.userName)) {
            flash.message3 = "Username is used"
            redirect(actionName: "index")
        }
        else if(params.password==params.confirmPassword){
            User x = signupService.signupMethod(params, request)
            if (x) {
                flash.success="registration successful, login"
                redirect(controller: 'user', action: 'index')
            } else {
                flash.error="registration failed"
                redirect(controller: 'user', action: 'index')
            }

        }
        else{
            flash.message4="password did not match"
            redirect(actionName: "index")
        }
    }
    def loginUser(){
        User x = loginService.loginMethod(params,request)
       if(x!= null){
            if(x.password==params.password){
                session.setAttribute('user',x)

                redirect(controller: 'dashboard', action: 'dashboard')
            }
            else{
                flash.message = "Incorrect Password"
                redirect(actionName:"index")
            }
        }
        else {
           flash.message1="user does not exist"
           redirect(actionName: "index")

       }
    }
    def forgetPassword() {
        render(view: "ForgetPassword")
    }
    def logout() {
        session.invalidate()
        redirect(controller: "user",actionName: "index")
    }
    def showUserList() {
            List<User> list = userListService.listMethod();
            render(view: "userList", model: [userList: list])
    }
    def userProfile(){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            Integer t_count = topicService.userTopicCountMethod(session.user.userName)
            Integer s_count = topicService.userSubCountMethod(session.user.userName)
            List userList = topicService.userTopicList(session.user.userName)
            List subList = subscriptionService.subscriptions(session.user.userName)
            render(view: "userProfile", model: [scount: s_count, tcount: t_count, userlist: userList,subscription:subList])
        }
    }
    def updateProfile(){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            String name = session.user.userName
            def u1 = updateService.updateProfile(params, request, name)
            if (u1) {
                flash.success = "profile updated successfully"
                session.setAttribute("user", u1)
                redirect(controller: "user", action: "userProfile")
            } else {
                flash.error = "Error try again"
                return null
            }
        }
    }
    def updatePassword(){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            String name = session.user.userName
            if (params.newPassword == params.newConfirmPassword) {
                def u = updateService.updatePassword(params, name)
                if (u) {
                    flash.success = "password updated successfully"
                    redirect(controller: "user", action: "userProfile")
                } else {
                    flash.error = "Error Try again"
                    redirect(controller: "user", action: "userProfile")
                }
            } else {
                flash.msg = "password not match"
                redirect(controller: "user", action: "userProfile")
            }
        }
    }
    def resetPassword(){
        String name = params.name
        if(params.newPassword==params.newConfirmPassword){
            def u = updateService.updatePassword(params,name)
            if(u){
                flash.message1 = "password updated successfully"
                redirect(url: "/")
            }
            else{
                flash.error = "Error Try again"
                redirect(url: "/")
            }
        }
        else{
            flash.message = "password not match"
            redirect(url: "/")
        }


    }
    def ResetPasswordEmail() {
        String value = params.token
        def token =Token.findByValue(value)
        if(token) {
            render(controller: "user", view: 'resetNewPass', model: [name: params.name])
        }
        else{
            redirect(url: "/")
        }

    }
    def activateUser(){
        User user =User.findByUserName(params.name)
        if(user.isActive()){
            flash.message = "user is already active"
        }
        else {
            user.active=true
            user.save(failOnError: true, flush: true)
        }
        redirect(controller: "user",action: "showUserList")
    }
    def deActivateUser(){
        User user =User.findByUserName(params.name)
        if(user.isActive()){
            user.active=false
            user.save(failOnError: true, flush: true)
        }
        else {
            flash.message = "user is already not active"
        }
        redirect(controller: "user",action: "showUserList")
    }
    def makeAdmin(){
        User user =User.findByUserName(params.name)
            user.admin=true
            user.save(failOnError: true, flush: true)

        redirect(controller: "user",action: "showUserList")
    }
}
