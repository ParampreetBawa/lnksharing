package com.ig.linksharing

class User {

    String email
    String password
    String confirmPassword
    Date date
    static transients = ['confirmPassword']
    static constraints = {
        email(email: true,nullable: false,blank: false,unique: true)
        confirmPassword(bindable:true,validator: {val,obj->
            if(!val.equals(obj.password))
                return false
        })
    }

    String toString(){
        return email
    }
}
