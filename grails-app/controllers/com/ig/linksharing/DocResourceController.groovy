package com.ig.linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocResourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DocResource.list(params), model: [docResourceInstanceCount: DocResource.count()]
    }

    def show(DocResource docResourceInstance) {
        respond docResourceInstance
    }

    def create() {
        respond new DocResource(params)
    }

    @Transactional
    def save(DocResource docResourceInstance) {
        if (docResourceInstance == null) {
            notFound()
            return
        }

        if (docResourceInstance.hasErrors()) {
            respond docResourceInstance.errors, view: 'create'
            return
        }

        docResourceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'docResourceInstance.label', default: 'DocResource'), docResourceInstance.id])
                redirect docResourceInstance
            }
            '*' { respond docResourceInstance, [status: CREATED] }
        }
    }

    def edit(DocResource docResourceInstance) {
        respond docResourceInstance
    }

    @Transactional
    def update(DocResource docResourceInstance) {
        if (docResourceInstance == null) {
            notFound()
            return
        }

        if (docResourceInstance.hasErrors()) {
            respond docResourceInstance.errors, view: 'edit'
            return
        }

        docResourceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DocResource.label', default: 'DocResource'), docResourceInstance.id])
                redirect docResourceInstance
            }
            '*' { respond docResourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DocResource docResourceInstance) {

        if (docResourceInstance == null) {
            notFound()
            return
        }

        docResourceInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DocResource.label', default: 'DocResource'), docResourceInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'docResourceInstance.label', default: 'DocResource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
