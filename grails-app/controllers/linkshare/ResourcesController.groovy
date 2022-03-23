package linkshare

import com.rxlogix.Users

class ResourcesController {

    def index() { }

    def postview(){
        Users test= session.getAttribute("usr")
        render(view: "post", model: [test:test])
    }
}
