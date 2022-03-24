package linkshare

import com.rxlogix.Users

class AdminController {
    def userlistService
    def index() { }
    def users() {
        List<Users> userlist = userlistService.AllUsers();
        Users user = session.getAttribute("usr")
        render(view: "admin", model: [userlist: userlist, user: user])
        }
    def makeAdmin() {

        String email = params.email
        userlistService.makeAdmin(email)
        redirect(controller: "admin", action: "users")

    }
    def active() {
        String email = params.email
        userlistService.activateOrDeactivate(email)
        redirect(controller: "admin", action: "users")

    }
}
