package linkshare

import com.rxlogix.LinkResource
import com.rxlogix.Resources
import com.rxlogix.Subscription
import com.rxlogix.Topic
import com.rxlogix.Users

class TopicController {

    def index() { }
    def topicshow(){
        Users user = session.getAttribute("usr")
        Topic topic = Topic.findById(params.tid)
        render(view: "topic", model: [user:user,topic:topic])
    }
    def createtopic(){
        Users user = session.getAttribute("usr")
        if(Topic.findByTopicNameAndCreatedBy(params.topicname,user)) {
            flash.message = "Topic name already exist"
        }
        else {
            Topic.Visibility v = params.topicv
            Topic topic = new Topic(topicName: params.topicname, visibility: v, createdBy: params.id)
            topic.save flush: true
            flash.message = "Topic Created"

            Subscription.Seriousness s = Subscription.Seriousness.VerySerious
            Subscription subs = new Subscription(topics: topic.id, createdBy: params.id, seriousness: s)
            subs.save(flush: true)
        }

        redirect(controller: 'dashboard', action: "dash")
    }
    def rating(){
        println("hello")
        redirect(controller: "resources",action: "postview")
    }

    def deletetopic(){
        Users user= session.getAttribute("usr")
        Topic topic= Topic.findById(params.id)
//        user.removeFromTopics(topic)
        topic.delete(flush: true)

        redirect(controller: "dashboard", action: "dash")
    }


}
