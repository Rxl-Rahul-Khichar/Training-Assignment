package demo

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{

        }

        "/"(view:"/index")
        "/"(controller: "User", action: "index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
