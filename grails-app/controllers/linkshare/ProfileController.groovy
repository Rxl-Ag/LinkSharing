package linkshare

import com.rxlogix.Users

class ProfileController {

    def index() { }
    def editprofile(){
        Users t  = session.getAttribute("usr")
        render(view: "editprofile", model: [test:t])
    }
    def updateprofile(){
        Users test  = session.getAttribute("usr")
        test.properties = params
//        test.firstname= params.get("firstname")
//        test.lastname= params.get("lastname")
//        test.username= params.get("username")
//        test.email= test.email
//        test.password= test.password
//        test.confirmpassword= test.password
//        test.save(flush:true,validate:true)
        if(test.save(flush:true)){
            flash.message= "profile updated"
        }
//        session.invalidate()
//        session.setAttribute("usr", test)
        redirect(action:"editprofile")
    }

    def updatepassword(){
        println(params.email)
        Users test=Users.findByEmail(params.email)
        test.firstname= test.firstname
        test.lastname= test.lastname
        test.username= test.username
        test.email= test.email
        test.password= params.get("password")
        test.confirmpassword= params.get("confirmpassword")
        if(test.save(flush:true)){
            flash.message= "Password updated"
        }
        render(view: "editprofile", model: [test:test])
    }


    def userprofile(){
        render (view: "userprofile")
    }
}
