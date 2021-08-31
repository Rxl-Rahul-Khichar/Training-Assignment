package com.rxlogix

class SearchController {
    def resourceService
    def topicService
    def subscriptionService
    def index() { }
    def search(){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else{
            String searchWord = params.word
            List top = resourceService.postList()
            List trending = topicService.trendTopicsMethod()
            List subList = subscriptionService.subscriptions(session.user.userName)
            render(view: 'search', model: [word:searchWord,top:top, trending:trending,subscription:subList])

        }
    }
}
