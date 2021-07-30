package com.rxlogix

class UserController {
    def loginService
    def signupService
    def userListService
    def index() {
        render(view: "index")
    }
    def action2(){
        render(view: "loginUser")
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
            /*try{
                u1.save(flush:true,failOnError:true)
                flash.success = "user successfully registered"
            } catch(Exception e){
                flash.error = "user registration failed"
            }
            redirect(actionName:"index")*/
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
                session.name=x.userName
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
        User u2 = User.findByUserName(session.name)
        render(view: "userProfile",model:[userdata:u2])
    }
    def updateProfile(){

    }
    def updatePassword(){

    }
}
