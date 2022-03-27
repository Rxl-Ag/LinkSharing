package linkshare

import com.rxlogix.*
import grails.transaction.Transactional

@Transactional
class DashboardService {

    def serviceMethod() {

    }
    def subscriptions(params) {
        Users user = Users.findByEmail(params)
        List<Subscription> subscriptionList = Subscription.findAllByCreatedBy(user)
        subscriptionList.sort {
            a,b->b.topics.lastUpdated<=>a.topics.lastUpdated
        }
        List<Subscription> subslist = []
        for (int i = 0; i<subscriptionList.size()&&5; i++) {
            subslist.add(subscriptionList.get(i))
        }

        return subslist
    }

    def topics() {
        List<Topic> topiclist = Topic.createCriteria().list(max:5) {
            eq('visibility', Topic.Visibility.Public)
        }
        topiclist.sort { a, b -> b.resources.size() <=> a.resources.size() }
        List<Topic> topicList = []
        for (int i = 0; i <topiclist.size()&&5; i++) {
            topicList.add(topiclist.get(i))
        }

        return topicList
    }
}
