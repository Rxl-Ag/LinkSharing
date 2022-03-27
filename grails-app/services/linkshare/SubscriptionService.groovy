package linkshare

import com.rxlogix.Subscription
import com.rxlogix.Topic
import grails.transaction.Transactional

@Transactional
class SubscriptionService {

    def serviceMethod() {

    }
    def seriousness(params) {

        Subscription subscription = Subscription.findById(params.sid)
        if (params.seriousness=="VerySerious")
            subscription.seriousness = subscription.seriousness.VerySerious
        else if (params.seriousness=="Serious")
            subscription.seriousness = subscription.seriousness.Serious
        else
            subscription.seriousness = subscription.seriousness.Casual

    }

    def visibility(params) {
        Topic topic = Topic.get(params.tid)
        if(params.visibility=="Public")
            topic.visibility = topic.visibility.Public
        else
            topic.visibility = topic.visibility.Private
    }
}
