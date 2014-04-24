package com.ig.linksharing

import grails.validation.Validateable

/**
 * Created by intelligrape on 21/4/14.
 */
@Validateable
class SubscriptionCO {
    int seriousnessLevel
    Topic topic
}
