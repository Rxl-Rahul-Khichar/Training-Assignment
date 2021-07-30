package com.rxlogix

class TestController {
    def index(){
        render(view: "show")
    }
    def action1() {
       // render(view: "show")
        //render(params)

        User u= new User(params)
        u.save(flush:true,failOnError:true)
    }
    def action4(){
        render(view: "empty")
    }
}
