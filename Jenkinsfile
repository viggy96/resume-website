container_args =    '--restart always ' +
                    '--volume $(pwd):/src ' +
                    '--network service_default ' +  
                    '--label traefik.enable=true ' +
                    '--label traefik.http.services.resume.loadbalancer.server.port=1313 ' +
                    '--label traefik.http.routers.resume.entrypoints=http ' +
                    '--label traefik.http.routers.resume.rule=Host(`www.viggy96.me`) ' +
                    '--label traefik.http.routers.resume-secure.rule=Host(`www.viggy96.me`) ' +
                    '--label traefik.http.routers.resume-secure.middlewares=secure@file ' +
                    '--label traefik.http.routers.resume-secure.tls=true ' +
                    '--label traefik.http.routers.resume-secure.tls.certresolver=http'
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build --tag hugo-builder:latest . --network dev_default'
                sh 'docker run --volume $(pwd):/src hugo-builder hugo --minify'
            }
        }
        
        stage('Run') {
            steps {
                sh  'docker run ' + container_args + ' hugo-builder hugo serve --environment production --baseURL https://www.viggy96.me --bind 0.0.0.0'
            }
        }
    }
}
