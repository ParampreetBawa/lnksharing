package com.ig.linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InviteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Invite.list(params), model:[inviteInstanceCount: Invite.count()]
    }

    def show(Invite inviteInstance) {
        respond inviteInstance
    }

    def create() {
        respond new Invite(params)
    }

    @Transactional
    def save(Invite inviteInstance) {
        if (inviteInstance == null) {
            notFound()
            return
        }

        if (inviteInstance.hasErrors()) {
            respond inviteInstance.errors, view:'create'
            return
        }

        inviteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'inviteInstance.label', default: 'Invite'), inviteInstance.id])
                redirect inviteInstance
            }
            '*' { respond inviteInstance, [status: CREATED] }
        }
    }

    def edit(Invite inviteInstance) {
        respond inviteInstance
    }

    @Transactional
    def update(Invite inviteInstance) {
        if (inviteInstance == null) {
            notFound()
            return
        }

        if (inviteInstance.hasErrors()) {
            respond inviteInstance.errors, view:'edit'
            return
        }

        inviteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Invite.label', default: 'Invite'), inviteInstance.id])
                redirect inviteInstance
            }
            '*'{ respond inviteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Invite inviteInstance) {

        if (inviteInstance == null) {
            notFound()
            return
        }

        inviteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Invite.label', default: 'Invite'), inviteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'inviteInstance.label', default: 'Invite'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
