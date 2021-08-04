package com.rxlogix

class DashboardController {
    def topicService
    def subscriptionService
    def resourceService
    def dashboard() {
        Integer t_count = topicService.userTopicCountMethod(session.user.userName)
        Integer s_count = topicService.userSubCountMethod(session.user.userName)
        List subList = subscriptionService.subscriptions(session.user.userName)
        List trending = topicService.trendTopicsMethod()
        List resourceList = resourceService.inboxResourceMethod()
       // List subTopicList = subList*.topic
        //List topicids = subTopicList.collect { it.id }
        //List counts = subscriptionService.topicSubs(topicids)
        //println counts
        render(view: "dashboard",model:[tcount:t_count,scount:s_count,subscription:subList,trending:trending,rsclist:resourceList])
    }


}
