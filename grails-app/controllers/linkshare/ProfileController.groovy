package linkshare

import com.rxlogix.Users

class ProfileController {

    def index() { }
    def editprofile(){
        Users user  = session.getAttribute("usr")
        render(view: "editprofile", model: [test:user])
    }
    def updateprofile(){

        Users user = Users.findById(params.uid)
        user.properties = params

        if(user.save(flush:true)){
            flash.message= "profile updated"
        }
        session.setAttribute("usr", user)
        redirect(action:"editprofile")
    }

    def updatepassword(){
        Users user = Users.findById(params.uid)
        user.properties = params

        if(user.save(flush:true)){
            flash.message= "Password updated"
        }
        session.setAttribute("usr", user)
        redirect(action:"editprofile")
    }


    def userprofile(){
        render (view: "userprofile")
    }
}
