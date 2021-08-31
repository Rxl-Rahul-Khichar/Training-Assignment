package com.rxlogix

class SendLinkController {

    def index() { }
    def sendInvite() {
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            User user = User.findByEmail(params.email)
            if (user) {
                Topic topic = Topic.findByTopicName(params.topicName)
                Long topicId = topic.id
                String link = "http://localhost:8082" + createLink(controller: 'subscription', action: 'sendSubscriptionInvite', params: [id: topicId, email: user.email])
                sendMail {
                    to "${params.email}"
                    subject "hello ${user.firstName} you have been invited to join topic ${topic.topicName}"
                    text link
                }
                flash.success = "Message sent at " + new Date()
                redirect(controller: 'dashboard', action: 'dashboard')
            } else {
                flash.error = "no such user exist"
                redirect(controller: 'dashboard', action: 'dashboard')
            }
        }
    }
    def resetPassword(){
        User user = User.findByEmail(params.email)
        if (user) {
            def token = Token.findByEmail(user.email)
            if(!token) {
                String val = UUID.randomUUID().toString().replaceAll('-', '')
                token = new Token(email: user.email,value: val)
                token.save(flush: true);
            }
            String link = "http://localhost:8082" + createLink(controller: 'user', action: 'ResetPasswordEmail',params:[name:user.userName,token:token.value])
            sendMail {
                to "${user.email}"
                subject "Hello ${user.firstName} Your password reset link is here!!!"
                text link
            }
            flash.success = "Check Your Mail"
            redirect(controller: "user", action: "forgetPassword")

        } else {
            flash.error = "no such user exist, register"
            redirect(controller: "user", action: "forgetPassword")
        }
    }
}