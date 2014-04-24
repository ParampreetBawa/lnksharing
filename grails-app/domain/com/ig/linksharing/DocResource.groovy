package com.ig.linksharing

class DocResource extends Resource {
    byte[] file

    static constraints = {
        file(nullable: false,maxSize: 5*1024*1024)
    }
}
