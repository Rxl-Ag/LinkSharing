package linkshare

import com.rxlogix.Subscription
import com.rxlogix.Topic
import com.rxlogix.Users

class DashboardController {

    def index() { }
    def dash(){
        Users user= session.getAttribute("usr")
        if(user) {
            render(view: "dashboard", model: [user: user])
        }
        else {
            render(view: "/index")
        }
    }




}
