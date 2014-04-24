package com.ig.linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserResourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserResource.list(params), model: [userResourceInstanceCount: UserResource.count()]
    }

    def show(UserResource userResourceInstance) {
        respond userResourceInstance
    }

    def create() {
        respond new UserResource(params)
    }

    @Transactional
    def save(UserResource userResourceInstance) {
        if (userResourceInstance == null) {
            notFound()
            return
        }

        if (userResourceInstance.hasErrors()) {
            respond userResourceInstance.errors, view: 'create'
            return
        }

        userResourceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userResourceInstance.label', default: 'UserResource'), userResourceInstance.id])
                redirect userResourceInstance
            }
            '*' { respond userResourceInstance, [status: CREATED] }
        }
    }

    def edit(UserResource userResourceInstance) {
        respond userResourceInstance
    }

    @Transactional
    def update(UserResource userResourceInstance) {
        if (userResourceInstance == null) {
            notFound()
            return
        }

        if (userResourceInstance.hasErrors()) {
            respond userResourceInstance.errors, view: 'edit'
            return
        }

        userResourceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserResource.label', default: 'UserResource'), userResourceInstance.id])
                redirect userResourceInstance
            }
            '*' { respond userResourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserResource userResourceInstance) {

        if (userResourceInstance == null) {
            notFound()
            return
        }

        userResourceInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserResource.label', default: 'UserResource'), userResourceInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userResourceInstance.label', default: 'UserResource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
    def markReadUnread(){
        println("$params.id.....$params.markread")
        render 'marked'
    }
}
