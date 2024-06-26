cytomine.ims.server.url = "https://abhishek.hurondigitalpathology.com/ims-service"
cytomine.ims.server.core.url = "http://core-service:8080/core-service"
cytomine.ims.server.publicKey = "147f1212-59a9-48bd-8a84-a17ab84e72df"
cytomine.ims.server.privateKey = "71acedb0-335b-41d6-b8d6-4e1acf830e3c"

cytomine.ims.path.buffer = "/data/images/_buffer"
cytomine.ims.path.storage = "/data/images"

cytomine.ims.conversion.bioformats.enabled = true
cytomine.ims.conversion.bioformats.hostname = bioformat-service
cytomine.ims.conversion.bioformats.port = 4321

cytomine.ims.pyramidalTiff.iip.url = "http://iipoff-service/fcgi-bin/iipsrv.fcgi"
cytomine.ims.openslide.iip.url = "http://iipcyto-service/fcgi-bin/iipsrv.fcgi"
//cytomine.ims.jpeg2000.iip.url = "://localhost-iip-jp2000/fcgi-bin/iipsrv.fcgi"

cytomine.ims.jpeg2000.enabled = false
cytomine.ims.deleteImageFilesFrequency=60000

log4j = {
    appenders {
        console name: 'stdout', layout: pattern(conversionPattern: '%d{yyyy-MM-dd HH:mm:ss} [%t] %-5p %c{2}:%L %M - %m%n')
    }

    root {
        info 'stdout'
    }
}