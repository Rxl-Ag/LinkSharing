package linkshare

import com.rxlogix.Subscription
import com.rxlogix.Topic
import com.rxlogix.Users

class DashboardController {
    def dashboardService
    def index() { }
    def dash(){
        Users user= session.getAttribute("usr")
        if(user) {
            List subscriptionList = dashboardService.subscriptions(user.email)
            List topiclist = dashboardService.topics()
            render(view: "dashboard", model: [user: user, subslist:subscriptionList, topiclist:topiclist])
        }
        else {
            render(view: "/index")
        }
    }




}
