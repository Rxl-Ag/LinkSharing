package linkshare

import com.rxlogix.Subscription
import com.rxlogix.Topic
import com.rxlogix.Users

class SubscriptionController {
    def subscriptionService
    def index() { }

    def subscribe(){
        Subscription.Seriousness s = Subscription.Seriousness.Serious
        Subscription subs = new Subscription(topics: params.tid, createdBy: params.uid, seriousness: s)
        subs.save(flush: true, failOnError:true)
        redirect(controller: 'dashboard', action: "dash")
    }

    def unsubscribe(){
        Users user = Users.findById(params.uid)
        Topic topic = Topic.findById(params.tid)
        Subscription s = Subscription.findByCreatedByAndTopics(user,topic)
        s.delete(flush: true, failOnError: true)
        redirect(controller: 'dashboard', action: "dash")
    }

    def changeserious(){
        println(params)
        subscriptionService.seriousness(params)
        redirect(controller: "dashboard", action: "dash")
    }
    def changevisibility(){
        subscriptionService.visibility(params)
        redirect(controller: "dashboard", action: "dash")
    }
}
