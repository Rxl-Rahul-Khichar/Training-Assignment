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
            List unread = resourceService.inboxListMethod(session.user.userName)
            println unread
            // List subTopicList = subList*.topic
            //List topicids = subTopicList.collect { it.id }
            //List counts = subscriptionService.topicSubs(topicids)
            //println counts
            render(view: "dashboard", model: [tcount: t_count, scount: s_count, subscription: subList, trending: trending, rsclist: resourceList, unread: unread])
    }
    def viewUserProfile(){
        User user = User.findById(params.id)
        String name  = user.userName
        List topicList = topicService.userTopicList(name)
        List rscList = resourceService.userResourceList(name)
        List subList = subscriptionService.userSubList(name)
        render(view:"profile",model: [user:user,topic:topicList,resource:rscList,subscriber:subList])
    }


}
