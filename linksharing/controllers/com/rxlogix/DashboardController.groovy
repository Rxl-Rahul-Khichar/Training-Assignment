package com.rxlogix

class DashboardController {

    def dashboard() {
        User u1= User.findByUserName(session.name)
        render(view: "dashboard",model:[userdata:u1])
    }


}
