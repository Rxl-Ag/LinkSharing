package linkshare

import com.rxlogix.Users

class DashboardController {

    def index() { }
    def dash(){
        Users test= session.getAttribute("usr")
        render(view: "dashboard", model: [test:test])
    }

}
