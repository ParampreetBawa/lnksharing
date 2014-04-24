package com.ig.linksharing

import org.apache.log4j.Logger

class AdminController {

    def index() {
        redirect action: 'stats'
    }
    def stats(){
        List<Subscription> subscriptionList = Subscription.list()
        Map<User,List<Subscription>> omap = subscriptionList.groupBy {
            it->
                it.user
        }
        def map = omap.collectEntries {entry->
            return [entry.key,entry.value.size()]
        }
        render view: 'stats', model: [noOfUsers:omap.size(),map:map]
    }
    def beforeInterceptor = [action: this.&adminAccessInterCeptor]
    def adminAccessInterCeptor(){
        log.trace('admin access interceptor called')
//        println('admin access interceptor called')
        if(!session.user || !session.user.equals('admin@intelligrape.com')){
            println('rendering invalid')
            render 'invalid'
            return false
        }
    }
}
