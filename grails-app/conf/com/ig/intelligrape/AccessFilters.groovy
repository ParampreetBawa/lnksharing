package com.ig.intelligrape

import org.apache.log4j.Logger

class AccessFilters {

    Logger logger
    def filters = {
        all(controller:'*', action:'*') {
            before = {

            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
        adminAccess(controller: 'admin',action: '*'){
            before = {
                log.trace('admin access filter called')
                if(!session.getAttribute('user').equals('admin@intelligrape.com'))
                    redirect controller: 'login',action: 'logout'
            }
        }
    }
}
