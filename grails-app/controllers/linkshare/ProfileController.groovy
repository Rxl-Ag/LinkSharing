package linkshare

import com.rxlogix.Users

class ProfileController {

    def index() { }
    def editprofile(){
        Users user  = session.getAttribute("usr")
        render(view: "editprofile", model: [user:user])
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

        if (params.get("password")!=params.get("confirmpassword"))
        {
            flash.message = "password and confirm password Do not match!"
            redirect(action : "editprofile")
        }

        else {
            Users user = Users.findById(params.uid)
            user.properties = params

            if (user.save(flush: true)) {
                flash.message = "Password updated"
            }
            session.setAttribute("usr", user)
            redirect(action: "editprofile")
        }
    }


    def userprofile(){
        Users user = session.getAttribute("usr")
        Users user1 = Users.findById(params.uid)
        render (view: "userprofile", model: [user:user, user1:user1])
    }
}
