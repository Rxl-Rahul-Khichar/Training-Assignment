package com.rxlogix

class UserController {

    def index() {
        render(view: "index")
    }
    def action2(){
        render(view: "loginUser")
    }
    def loginUser(){
        def x = User.findByUserName(params.userName)

       if(x!= null){
            if(x.password==params.password){
                render(view: "loginUser")
                return
            }
            else{
                flash.message = "Password did not match"
                redirect(actionName:"index")
            }
        }
        else {
           flash.message1="user does not exist"
           redirect(actionName: "index")

       }
    }
    def registerUser() {
        User u1 = new User(params)
        if (User.findByEmail(params.email)) {
            flash.message2 = "Email is used"
            redirect(actionName: "index")
        } else if (User.findByUserName(params.userName)) {
            flash.message3 = "Username is used"
            redirect(actionName: "index")
        }
        else {
            try{
                u1.save(flush:true,failOnError:true)
                flash.success = "user successfully registered"
            } catch(Exception e){
                flash.error = "user registration failed"
            }
            redirect(actionName:"index")
        }
        }
    def forgetPassword() {
        render(view: "ForgetPassword")
    }


}
