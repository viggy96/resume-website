node {
    checkout scm
    def website_container

    stage('Build') {
        website_container = docker.build("viggy96/resume-website", "--network dev_default .")
    }
    
    stage('Test') {
        website_container.inside {
            sh  'timeout 15s hugo serve --baseURL localhost --bind 0.0.0.0'
        }
    }

    stage('Deploy') {     
        docker.withRegistry('', 'DockerHub') {
            website_container.push()
        }
        sh "docker rmi viggy96/resume-website:latest"
    }
}
