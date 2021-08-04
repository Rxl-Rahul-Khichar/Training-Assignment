package com.rxlogix

class ResourcesController {
    def resourceService
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
}
