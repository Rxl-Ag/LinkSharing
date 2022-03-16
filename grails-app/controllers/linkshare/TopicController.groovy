package linkshare

import com.rxlogix.Topic
import com.rxlogix.Users

class TopicController {

    def index() { }
    def topicshow(){
        Users t = session.getAttribute("usr")
        render(view: "topic", model: [test:t])
    }
    def createtopic(){

        Topic.Visibility v =  params.topicv
        Topic t=new Topic(topicName: params.topicname, visibility: v, createdBy: params.id)
        t.save flush: true

        Users test = Users.findById(params.id)
        redirect(controller: 'dashboard', action: "dashboard", params:[uname:test.username])
    }
}
