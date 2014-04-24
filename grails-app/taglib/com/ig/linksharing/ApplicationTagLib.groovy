package com.ig.linksharing

class ApplicationTagLib {
//    static defaultEncodeAs = 'html'
    //static encodeAsForTags = [tagName: 'raw']
    static namespace = "ls"
    def unreadItems = { attr ->
        List<Resource> resources = attr.resources
        int count = Integer.parseInt(attr.get('countt'))
        if (count > resources.size()) count = resources.size()
        out << render(template: '/user/showReadingItems', model: [resources: resources.subList(0, count)])
    }
    def subscribedTopics = { attr ->
        out << render(template: '/user/showTopics', model: [topics: attr.topics, caption: 'Subscribed Topics'])
    }
    def ownedTopics = { attr ->
        User user = User.findByEmail(session.user)
        List<Topic> list = attr.topic
        list = list.each { it.createdBy.email == user.email }
        out << render(template: '/user/showTopics', model: [topics: list, caption: 'Owned Topics'])
    }
    def formattedDate = { attr ->
        String format = attr.format
        Date date = new Date()

        String formatedDate = ''
        try {
            formatedDate = date.format(format)
        } catch (Exception e) {
            formatedDate = date.format("dd-MM-yyyy")
        }
        out << formatedDate
    }
}
