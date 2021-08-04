package com.rxlogix

class UserController {
    def loginService
    def signupService
    def userListService
    def topicService
    def updateService
    def resourceService
    def index() {
        List rsc = resourceService.recentResourceMethod()
        render(view: "index")
    }
    def action2(){
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
        Integer t_count = topicService.userTopicCountMethod(session.user.userName)
        Integer s_count = topicService.userSubCountMethod(session.user.userName)
        List userList = topicService.userTopicList(session.user.userName)
        render(view: "userProfile",model:[scount:s_count,tcount:t_count,userlist:userList])
    }
    def updateProfile(){
        String name = session.user.userName
        def u1 = updateService.updateProfile(params, request, name)
        if(u1){
            flash.success = "profile updated successfully"
            session.setAttribute("user",u1)
            redirect(controller: "user", action: "userProfile")
        }
        else{
            flash.error = "Error try again"
            return
        }
    }
    def updatePassword(){
        String name = session.user.userName
        if(params.newPassword==params.newConfirmPassword){
            def u = updateService.updatePassword(params,name)
            if(u){
                flash.success = "password updated successfully"
                redirect(controller: "user", action:"userProfile")
            }
            else{
                flash.error = "Error Try again"
                redirect(controller: "user", action:"userProfile")
            }
        }
        else{
            flash.msg = "password not match"
            redirect(controller: "user", action:"userProfile")
        }
    }
}
