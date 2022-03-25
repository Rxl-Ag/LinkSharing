package linkshare

import com.rxlogix.Document
import com.rxlogix.LinkResource
import com.rxlogix.ReadingItem
import com.rxlogix.Resources
import com.rxlogix.Users

class ResourcesController {

    def index() { }

    def createlinkresource(){
        Resources resource = new Resources(description: params.description, createdBy: params.id, topics: params.topicname)
        resource.save(flush:true, failOnError:true)

        LinkResource lr = new LinkResource(url: params.url, resource: resource )
        lr.save(flush:true, failOnError:true)

        redirect(controller: 'dashboard', action: "dash")

    }

    def createdocresource(){
        Resources resource = new Resources(description: params.doc, createdBy: params.id, topics: params.topicname)
        resource.save(flush:true, failOnError:true)


        def file = request.getFile("docfile")
        String filepath = "/home/anurag/grailsapp/linkshare/grails-app/assets/images/document/${params.id}.pdf"
        String path = "${params.id}.pdf"
        if (file && !file.empty) {
            file.transferTo(new File(filepath))
        }
        Document document = new Document(filePath: path, resource: resource)
        document.save(flush:true, failOnError:true)
        redirect(controller: 'dashboard', action: "dash")

    }


    def postview(){
        Users user= session.getAttribute("usr")
        Resources resource = Resources.findById(params.id)
        render(view: "post", model: [user:user, resource: resource])
    }
    def isread(){
        Users user = session.getAttribute("usr")

        ReadingItem readingItem = new ReadingItem(usr: user.id, resource: params.id, isRead: true)
        readingItem.save(flush:true, failOnErrror:true)
        redirect(controller: 'dashboard', action: "dash")
    }

    def download(){
        println(params.id)
        Resources resource = Resources.findById(params.id)
        Users user = Users.findById(params.id)
//        String path = Document.findByResource(resource).filePath
        def filePath = "/home/anurag/grailsapp/linkshare/grails-app/assets/images/document/${user.id}.pdf"
        def file = new File(filePath)
        if (file.exists()){
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "filename=${file.getName()}")
            response.outputStream << file.bytes
        }else {
            //handle file not found messages.
        }
        redirect(controller: 'dashboard', action: "dash")
    }

}
