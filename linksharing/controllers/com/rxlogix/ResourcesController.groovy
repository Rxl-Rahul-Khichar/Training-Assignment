package com.rxlogix

class ResourcesController {
    def resourceService
    def readingService
    def topicService
    def index() { }
    def saveDocument() {
            String name = session.user.userName
            def rs = resourceService.uploadDocumentMethod(params, request, name)
            if(rs) {
                flash.success = "doc uploaded"
                redirect(controller: "dashboard", action: "dashboard")
            }
            else{
                flash.error = "failed"
                redirect(controller: "dashboard", action: "dashboard")
            }
    }
    def saveLink(){
        String name = session.user.userName
        def rs = resourceService.uploadLinkMethod(params,name)
        if(rs) {
            flash.success = "doc uploaded"
            redirect(controller: "dashboard", action: "dashboard")
        }
        else{
            flash.error = "failed"
            redirect(controller: "dashboard", action: "dashboard")
        }
    }
    def downloadFile(){
        DocumentResource doc = (DocumentResource) Resource.get(params.id)
        def file = new File("${doc.filePath}")
        if (file.exists())
        {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "attachment;filename=\"${file.name}\"")
            response.outputStream << file.bytes
        }
        else render "Error!"
    }
    def markRead(){
        String name = session.user.userName
        readingService.markAsReadMethod(params,name)
        redirect( controller: "dashboard",action: "dashboard")
    }
    def viewPost(){
        Long id = Long.parseLong(params.id)
        Resource rsc = Resource.get(id)
        Integer rating = resourceService.sumRating(id)
        List trending = topicService.trendTopicsMethod()
        render(view: "showPost",model: [post:rsc,rating:rating,trending:trending])
    }
}
