package linkshare

import com.rxlogix.Subscription
import com.rxlogix.Topic
import com.rxlogix.Users

class TopicController {

    def index() { }
    def topicshow(){
        Users user = session.getAttribute("usr")
        render(view: "topic", model: [test:user])
    }
    def createtopic(){

        Topic.Visibility v =  params.topicv
        Topic t=new Topic(topicName: params.topicname, visibility: v, createdBy: params.id)
        t.save flush: true

        Subscription.Seriousness s = Subscription.Seriousness.VerySerious
        Subscription subs = new Subscription(topics: t.id, createdBy: params.id, seriousness: s)
        subs.save(flush:true)

        redirect(controller: 'dashboard', action: "dash")
    }
}
