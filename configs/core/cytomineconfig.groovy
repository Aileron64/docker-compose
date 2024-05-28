dataSource.url='jdbc:postgresql://postgresql:5432/docker'
dataSource.username='docker'
dataSource.password='docker'

cytomine.customUI.global = [
        dashboard: ["ALL"],
        search : ["ROLE_ADMIN"],
        project: ["ALL"],
        ontology: ["ROLE_ADMIN"],
        storage : ["ROLE_USER","ROLE_ADMIN"],
        activity : ["ALL"],
        feedback : ["ROLE_USER","ROLE_ADMIN"],
        explore : ["ROLE_USER","ROLE_ADMIN"],
        admin : ["ROLE_ADMIN"],
        help : ["ALL"]
]

grails.serverURL='https://redhat.hurondigitalpathology.com'
grails.imageServerURL=['https://redhat-ims.hurondigitalpathology.com','https://redhat-ims2.hurondigitalpathology.com']
grails.uploadURL='https://redhat-upload.hurondigitalpathology.com'
grails.grpcURL='http://192.168.3.5:18084'
grails.grpcToken='122534yteyfghfghfgh3434232'

storage_buffer='/data/images/_buffer'
storage_path='/data/images'
cytomine.jobdata.filesystem='/home/alex/job_data'

grails.adminPassword='huron@123'
grails.adminPrivateKey='d224b050-c308-4281-b352-8e8c15bf7da5'
grails.adminPublicKey='90bb0ed7-5e9f-45f5-9f09-1edbaf4c8d9a'
grails.superAdminPrivateKey='cbe34133-8e67-4fe8-9ad0-137a7660daed'
grails.superAdminPublicKey='7693914e-f5ce-4156-a249-b5a92e3eb661'
grails.ImageServerPrivateKey='71acedb0-335b-41d6-b8d6-4e1acf830e3c'
grails.ImageServerPublicKey='147f1212-59a9-48bd-8a84-a17ab84e72df'
grails.rabbitMQPrivateKey='deea18c1-5b95-44ba-9937-5ffda0524882'
grails.rabbitMQPublicKey='391093dc-108a-4d63-b360-d2c35173c63b'

grails.notification.email='your.email@gmail.com'
grails.notification.password='passwd'
grails.notification.smtp.host='smtp.gmail.com'
grails.notification.smtp.port='587'
grails.admin.email='info@cytomine.coop'

grails.mongo.host = 'mongodb'
grails.mongo.options.connectionsPerHost=10
grails.mongo.options.threadsAllowedToBlockForConnectionMultiplier=5

cytomine.middleware.rabbitmq.user="slidevault"
cytomine.middleware.rabbitmq.password="slidevault"
grails.messageBrokerServerURL='rabbitmq:5672'

grails.serverID='854e8b19-ba1f-4509-a72a-ca25c7cd5569'

grails.plugin.springsecurity.successHandler.ajaxSuccessUrl = "${grails.serverURL}/login/ajaxSuccess"
grails.plugin.springsecurity.failureHandler.ajaxAuthFailUrl = "${grails.serverURL}/login/authfail?ajax=true"
