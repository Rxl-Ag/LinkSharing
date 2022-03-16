package linkshare

import com.rxlogix.Users

class LoginController {

    def index() { }
    def login(){
        render(view: "/index")
    }
    def log() {

        if(Users.findByEmail(params.logemail) )
        {
            Users t = Users.findByEmail(params.logemail)
            session.setAttribute("usr", t)
            if (t.password==params.logpassword) {
                redirect(controller: 'dashboard', action: "dash")
            }
            else {
                flash.message = "password not match!"
                redirect(action: "login")
            }
        }
        else{
            flash.message = "user not exist!"
            redirect(action : "login")
        }
    }
    def register() {
        if(!Users.findByEmail(params.email))
        {
            if(!Users.findByUsername(params.username))
            {
                if (params.get("password")==params.get("confirmpassword"))
                {
                    Users test = new Users(firstname: params.firstname, lastname: params.lastname, email: params.email, username: params.username, password: params.password, confirmpassword: params.confirmpassword, admin: false, active: true)
                    test.save flush: true
                    flash.message = "user created!"
                    redirect(action : "login")
                }
                else{
                    flash.message = "password and confirm password Do not match!"
                    redirect(action : "login")
                }

            }
            else{
                flash.message = "UserName Already Exists!"
                redirect(action : "login")
            }
        }
        else{
            flash.message = "Email already Exists"
            redirect(action : "login")
        }
    }
    def logout()
    {
        session.invalidate()
        redirect(action : "login")
    }
}
