package com.ig.linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubscriptionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Subscription.list(params), model: [subscriptionInstanceCount: Subscription.count()]
    }

    def show(Subscription subscriptionInstance) {
        respond subscriptionInstance
    }

    def create() {
        respond new Subscription(params)
    }

    @Transactional
    def save(SubscriptionCO subscriptionCO) {
        User user = User.findByEmail(session.user)
        println("${subscriptionCO.topic}.......... ${subscriptionCO.seriousnessLevel}")
        Subscription subscriptionInstance = new Subscription(user: user,seriousnessLevel: subscriptionCO.seriousnessLevel,topic:subscriptionCO.topic)
        if (subscriptionInstance == null) {
            notFound()
            return
        }

        if (subscriptionInstance.hasErrors()) {
            respond subscriptionInstance.errors, view: 'create'
            return
        }

        subscriptionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subscriptionInstance.label', default: 'Subscription'), subscriptionInstance.id])
                respond subscriptionInstance
            }
            '*' { respond subscriptionInstance, [status: CREATED] }
        }
    }

    def edit(Subscription subscriptionInstance) {
        respond subscriptionInstance
    }

    @Transactional
    def update(Subscription subscriptionInstance) {
        if (subscriptionInstance == null) {
            notFound()
            return
        }

        if (subscriptionInstance.hasErrors()) {
            respond subscriptionInstance.errors, view: 'edit'
            return
        }

        subscriptionInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Subscription.label', default: 'Subscription'), subscriptionInstance.id])
                redirect subscriptionInstance
            }
            '*' { respond subscriptionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Subscription subscriptionInstance) {

        if (subscriptionInstance == null) {
            notFound()
            return
        }

        subscriptionInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Subscription.label', default: 'Subscription'), subscriptionInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscriptionInstance.label', default: 'Subscription'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
