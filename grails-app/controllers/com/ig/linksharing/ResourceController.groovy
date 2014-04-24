package com.ig.linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Resource.list(params), model: [resourceInstanceCount: Resource.count(),resourceInstanceList:Resource.list()]
    }

    def show(Resource resourceInstance) {
       respond resourceInstance, model: [resourceInstance:resourceInstance]
    }

    def create() {
        respond new Resource(params)
    }

    @Transactional
    def save(ResourceCO resourceCO) {
        User user = User.findByEmail(session.user)
        println(resourceCO.file.length)
        Resource resourceInstance
        if(resourceCO.resourceType.equals("document"))
            resourceInstance = new DocResource(title: resourceCO.title,createdBy:user,file:resourceCO.file,summary: resourceCO.summary)
        else
            resourceInstance = new LinkResource(title: resourceCO.title,createdBy: user,url: resourceCO.link,summary: resourceCO.summary)

        if (resourceInstance == null) {
            notFound()
            return
        }



        resourceInstance.save flush: true, failOnError: true
        UserResource resource = new UserResource(resource: resourceInstance,user: user)
        resource.save()
        if (resourceInstance.hasErrors()) {
            respond resourceInstance.errors, view: 'create'
            return
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'resourceInstance.label', default: 'Resource'), resourceInstance.id])
                respond resourceInstance
            }
            '*' { respond resourceInstance, [status: CREATED] }
        }
    }

    def edit(Resource resourceInstance) {
        respond resourceInstance
    }

    @Transactional
    def update(Resource resourceInstance) {
        if (resourceInstance == null) {
            notFound()
            return
        }

        if (resourceInstance.hasErrors()) {
            respond resourceInstance.errors, view: 'edit'
            return
        }

        resourceInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Resource.label', default: 'Resource'), resourceInstance.id])
                respond resourceInstance
            }
            '*' { respond resourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Resource resourceInstance) {

        if (resourceInstance == null) {
            notFound()
            return
        }

        resourceInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Resource.label', default: 'Resource'), resourceInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'resourceInstance.label', default: 'Resource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

}
