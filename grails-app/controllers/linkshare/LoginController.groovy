package linkshare

import com.rxlogix.Resources
import com.rxlogix.Topic
import com.rxlogix.Users
import grails.converters.JSON

class LoginController {

    def index() {

    }
    def login(){
        render(view: "/index")
    }
    def log() {

        if(Users.findByEmail(params.logemail) )
        {
            Users t = Users.findByEmail(params.logemail)
            if(!t.active)
            {
                flash.message = "login failed!"
                redirect(action : "login")
            }
            else {
                session.setAttribute("usr", t)
                if (t.password == params.logpassword) {
                    redirect(controller: 'dashboard', action: "dash")
                } else {
                    flash.message = "password not match!"
                    redirect(action: "login")
                }
            }
        }
        else{
            flash.message = "user not exist!"
            redirect(action : "login")
        }
    }
    def register() {
        if (!Users.findByEmail(params.email)) {
            if (!Users.findByUsername(params.username)) {
                if (params.get("password") == params.get("confirmpassword")) {
                    def file = request.getFile("userImage")
                    String filepath = "/home/anurag/grailsapp/linkshare/grails-app/assets/images/${params.email}.png"
                    String path = "${params.email}.png"
                        if (file && !file.empty) {
                            file.transferTo(new File(filepath))
                        }
                        else {
                            path=null
                        }
                    Users test = new Users(firstname: params.firstname, lastname: params.lastname, email: params.email, username: params.username, password: params.password, confirmpassword: params.confirmpassword, admin: false, active: true, userImage: path)

                    test.save flush: true
                    flash.message1 = "user created!"
                    redirect(action: "login")
                } else {
                    flash.message1 = "password and confirm password Do not match!"
                    redirect(action: "login")
                }

            } else {
                flash.message1 = "UserName Already Exists!"
                redirect(action: "login")
            }
        } else {
            flash.message1 = "Email already Exists"
            redirect(action: "login")
        }
    }
    def logout()
    {
        session.invalidate()
        redirect(action : "login")
    }
    def password(){
        render(view: "/forgetPassword")
    }
    def forgotpassword(){
        Users user = Users.findByEmail(params.email)
        if(user){
            if(params.password== params.confirmpassword){
                user.password= params.password
                user.confirmpassword= params.confirmpassword
                user.save(flush: true)
                flash.message3 = "Password Changed"
                render(view: "/index")
            }
            else{
                flash.message = "password and confirm password Do not match!"
                render(view: "/forgetPassword")
            }
        }
        else{
            flash.message = "Wrong Email"
            render(view: "/forgetPassword")
        }
    }
}
