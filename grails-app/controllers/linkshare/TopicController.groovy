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
        render(view: "topic", model: [test:user])
    }
    def createtopic(){

        Topic.Visibility v =  params.topicv
        Topic t=new Topic(topicName: params.topicname, visibility: v, createdBy: params.id, datecreate: new Date(), lastupdate: new Date())
        t.save flush: true

        Subscription.Seriousness s = Subscription.Seriousness.VerySerious
        Subscription subs = new Subscription(topics: t.id, createdBy: params.id, seriousness: s, datecreate: new Date())
        subs.save(flush:true)

        redirect(controller: 'dashboard', action: "dash")
    }
    def createresource(){
        Resources re = new Resources(description: params.description, createdBy: params.id, dateCreate: new Date(), lastUpdate: new Date(), topics: params.topicname)
//        re.save(flush:true, failOnError:true)

        LinkResource lr = new LinkResource(url: params.url, resource: re )
        println(lr.url)
        lr.save(flush:true, failOnError:true)

        redirect(controller: 'dashboard', action: "dash")


    }

}
