rabbitmq.host = "rabbitmq"
rabbitmq.port = "5672"
rabbitmq.username='slidevault'
rabbitmq.password='slidevault'

cytomine.core.url='https://redhat.hurondigitalpathology.com'
cytomine.core.publicKey='391093dc-108a-4d63-b360-d2c35173c63b'
cytomine.core.privateKey='deea18c1-5b95-44ba-9937-5ffda0524882'

cytomine.software.communication.exchange = "exchangeCommunication"
cytomine.software.communication.queue = "queueCommunication"

cytomine.software.path.softwareSources='/data/softwares/code'
cytomine.software.path.softwareImages='/data/softwares/images'
cytomine.software.path.jobs='/data/jobs'
cytomine.software.sshKeysFile='/root/.ssh/id_rsa'
cytomine.software.descriptorFile = "descriptor.json"

cytomine.software.ssh.maxRetries = 3
cytomine.core.connectionRetries = 20
cytomine.software.allowDockerfileCompilation = true

// In seconds
cytomine.software.repositoryManagerRefreshRate = 3600
cytomine.software.job.logRefreshRate = 15
cytomine.software.pullingCheckRefreshRate = 20
cytomine.software.pullingCheckTimeout = 1800
cytomine.core.connectionRefreshRate = 30

cytomine.software.github.username=""
cytomine.software.github.token=""

cytomine.software.dockerhub.username=""
cytomine.software.dockerhub.password=""

