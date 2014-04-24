package com.ig.linksharing

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

/**
 * Created by intelligrape on 22/4/14.
 */
@Validateable
class ResourceCO {
    String summary
    String title
    String resourceType
    byte[] file
    String link
}
