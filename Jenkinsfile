pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
            additionalBuildArgs '--network dev_default'
            args    '--restart always ' +
                    '--network dev_default ' +  
                    '--label traefik.enable=true ' +
                    '--label traefik.http.services.resume.loadbalancer.server.port=1313 ' +
                    '--label traefik.http.routers.resume.entrypoints=http ' +
                    '--label traefik.http.routers.resume.rule=Host(`www.viggy96.me`) ' +
                    '--label traefik.http.routers.resume-secure.rule=Host(`www.viggy96.me`) ' +
                    '--label traefik.http.routers.resume-secure.middlewares=secure@file ' +
                    '--label traefik.http.routers.resume-secure.tls=true ' +
                    '--label traefik.http.routers.resume-secure.tls.certresolver=http'
                   
        }
    }
    stages {
        stage('Build') {
            steps { sh 'hugo --minify' }
        }
        
        stage('Run') {
            steps { 
                sh  'daemonize -E JENKINS_NODE_COOKIE=dontKillMe ' +
                    'hugo serve --baseURL https://www.viggy96.me --appendPort false --bind 0.0.0.0'
            }
        }
    }
}
