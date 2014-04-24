package com.ig.linksharing

import javax.persistence.criteria.Expression
import javax.persistence.criteria.Order

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userInstance.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInstance.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def home(){
        forward action: 'dashboard'
    }
    def dashboard(){
        User user = User.findByEmail(session.user)
        def resources = []
        UserResource.findAllByUserAndIsRead(user,false).each {
            resources.add(it.resource)
        }

        def topics = []
        Subscription.findAllByUser(user).each {
            topics.add(it.topic)
        }
        render view :'home' ,model: [resources:resources,topics:topics]
    }
    def register(){
        def link = "${createLink(controller: 'user', action: 'validateEmail')}"
        render view:'register', model:[validateEmail:link]
    }
    @Transactional
    def registerHandler(UserCO user){
        println user.password +" "+user.confirmPassword +" "+user.email+" "+user.date
//        User user1 = new User(email: user.email , password: user.password,confirmPassword: user.confirmPassword)
//        user1.save()
//        render view:'register',model: [userInstance:user1]
    }
    def validateEmail(){
        render User.findByEmail(params.email) ? 'false':'true'
    }
}
