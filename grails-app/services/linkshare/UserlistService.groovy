package linkshare

import com.rxlogix.Users
import grails.transaction.Transactional

@Transactional
class UserlistService {

    def serviceMethod() {

    }
    def AllUsers() {
        List AllUserList = Users.list()
        return AllUserList;
    }
    def makeAdmin(String email) {
        Users user = Users.findByEmail(email)
            if (user.admin) {
                user.admin = false
            } else {
                user.admin = true
            }
        user.save(failOnError: true, flush: true)
        return user
    }
    def activateOrDeactivate(String email) {
        Users user = Users.findByEmail(email)
            if (user.active) {
                user.active = false
            } else {
                user.active = true
            }
        user.save(failOnError: true, flush: true)
        return user
    }
}
