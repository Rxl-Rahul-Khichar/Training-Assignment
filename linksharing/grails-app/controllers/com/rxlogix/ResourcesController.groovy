package com.rxlogix

import org.springframework.web.multipart.MultipartFile

class ResourcesController {
    def resourceService
    def readingService
    def topicService
    def subscriptionService
    def index() { }
    def saveDocument() {
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            String name = session.user.userName
            def rs = resourceService.uploadDocumentMethod(params, request, name)
            if (rs) {
                flash.success = "doc uploaded"
                redirect(controller: "dashboard", action: "dashboard")
            } else {
                flash.error = "failed"
                redirect(controller: "dashboard", action: "dashboard")
            }
        }
    }
    def saveLink(){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            String name = session.user.userName
            def rs = resourceService.uploadLinkMethod(params, name)
            if (rs) {
                flash.success = "doc uploaded"
                redirect(controller: "dashboard", action: "dashboard")
            } else {
                flash.error = "failed"
                redirect(controller: "dashboard", action: "dashboard")
            }
        }
    }
    def downloadFile(){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            DocumentResource doc = (DocumentResource) Resource.get(params.id)
            def file = new File("${doc.filePath}")
            if (file.exists()) {
                response.setContentType("application/octet-stream")
                response.setHeader("Content-disposition", "attachment;filename=\"${file.name}\"")
                response.outputStream << file.bytes
            } else render "Error!"
        }
    }
    def markRead(){
        if(!session.user){
            flash.mess = "login first"
            redirect(controller:"user",actionName:"index")
        }
        else {
            String name = session.user.userName
            readingService.markAsReadMethod(params, name)
            redirect(controller: "dashboard", action: "dashboard")
        }
    }
    def viewPost(){
        if(!session.user){
            Long id = Long.parseLong(params.id)
            Resource rsc = Resource.get(id)
            Integer rating = resourceService.sumRating(id)
            List trending = topicService.trendTopicsMethod()
            render(view: "showPost",model: [post:rsc,rating:rating,trending:trending])
        } else {
            Long id = Long.parseLong(params.id)
            Resource rsc = Resource.get(id)
            Integer rating = resourceService.sumRating(id)
            List trending = topicService.trendTopicsMethod()
            List subList = subscriptionService.subscriptions(session.user.userName)
            render(view: "showPost", model: [post: rsc, rating: rating, trending: trending, subscription: subList])
        }
    }
    def showPostList(){
        List list = Resource.list()
        render(view: 'postList', model: [postList: list])
    }
    def deleteResource(){
        Resource rsc = Resource.findById(params.id)
        rsc.delete(flush:true)
        redirect url: "/"
    }
    def editLink(){
        Resource r = Resource.findById(params.id)
        r.description = params.description
        r.url = params.link
        r.save(flush:true,failOnError:true)
        redirect(controller: "resources",action: "viewPost", params:[id:r.id])
    }
    def editDocument(params,request){
        Resource r = Resource.findById(params.id)
        r.description = params.description
        MultipartFile doc = request.getFile('document')
        if(doc && !doc.empty){
            String fName = doc.getOriginalFilename()
            String fPath = "/home/rxlogix/IdeaProjects/demo/grails-app/assets/documents/" + fName
            File file= new File(fPath)
            doc.transferTo(file)
            r.filePath = fPath
        }
        else{
            r.filePath = r.filePath
        }
        r.save(flush:true,failOnError:true)
        redirect(controller: "resources",action: "viewPost", params:[id:r.id])
    }
}
