package linkshare

import com.rxlogix.Users

class BootStrap {

    def init = { servletContext ->
        new Users(firstname: "Anurag",lastname: "Gupta",email: "anurag.gupta1@rxlogix.com", username: "anurag123",admin: true, active: true, password: "121212", confirmpassword: "121212", userImage: "anurag123.png" ).save(flush:true)
        new Users(firstname: "dummy",lastname: "name",email: "dummy@rxlogix.com", username: "dummy",admin: false, active: true, password: "dummy", confirmpassword: "dummy", userImage:null ).save(flush:true)
        println "initializing data..."
    }
    def destroy = {
    }
}
