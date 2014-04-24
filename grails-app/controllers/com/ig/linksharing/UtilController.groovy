package com.ig.linksharing

import org.hibernate.criterion.CriteriaSpecification

import java.sql.Connection
import java.sql.DriverManager

class UtilController {

    def index() {
        User user = User.findOrCreateById(1)
        user.email = 'parampreet.singh@intelligrape.com'
        user.password = 'igdefault'
        user.save()

        if (!user.hasErrors())
            println('user saved successfully.........')
        else {
            user.errors.allErrors.each {
                println(it)

            }
            return
        }
        Topic topic = Topic.findOrCreateById(1)
        topic.name = 'Topic -- test topic A'
        topic.createdBy = user
        topic.resources = new HashSet<Resource>()


        10.times {
            LinkResource resource = LinkResource.findOrCreateById(it)
            resource.title = "Resource ${it}"
            resource.createdBy = user
            resource.url = new URL("http://bootcamp.intelligrape.com/schedule/list")
            resource.summary = "Summary ${it}"
            topic.resources.add resource
        }

        topic.save()
        if (!topic.hasErrors())
            println('topic saved')
        else {
            topic.errors.allErrors.each {
                println(it)
            }
            return
        }


        Subscription subscription = new Subscription(topic: topic, user: user, seriousnessLevel: 7)
        subscription.save()

        if (!subscription.hasErrors())
            println('subscription saved')
        else {
            subscription.errors.allErrors.each {
                println(it)
            }
            return
        }

        Set<Integer> set = new HashSet<Integer>();
        while (set.size() != 3) {
            double num = Math.random() * 10
            num = num.round()
            set.add num
        }
        println(topic.resources)
        topic.resources.eachWithIndex { Resource entry, int i ->
            UserResource userResource = UserResource.findOrCreateByUserAndResource(user, entry)
            userResource.user = user
            userResource.resource = entry
            if (set.contains(i))
                userResource.isRead = true
            userResource.save()
            if (!userResource.hasErrors())
                println('userresource saved')
            else
                return
        }
    }

    def criteria() {

        def list = Subscription.createCriteria().list {
            maxResults(5)
            'topic' {
                isPrivate: false
            }
            resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
            projections {
                count("topic", 'total')
                groupProperty("topic", 'topic')
            }

            order("total", 'desc')
        }
        println(list)
    }

    def criteria2() {
        def user = User.findByEmail(session.user)
        println(UserResource.findAllByUser(user))
        def list = UserResource.createCriteria().list {
            eq('user', user)
        }
        print(list.size())
    }

    def testAjax() {
        render "true"
    }

    def upload() {
        try {
            Class.forName("com.mysql.jdbc.Driver")
        } catch (Exception e) {
            e.printStackTrace()
        }
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/linksharing")
        println("${con}...................")
    }
    def mailService
    def customBean
    def mail(){
        println("${customBean}.............custom bean")
        mailService.sendMail {
            to "parampreet.singh@intelligrape.com"
            from "parampreet.singh@intelligrape.com"
            subject "Hello John"
            body 'this is some text'
        }
    }
}
