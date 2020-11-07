node {
    checkout scm
    def website_container

    stage('Build') {
        website_container = docker.build("viggy96/resume-website")
    }

    stage('Deploy') {     
        docker.withRegistry('', 'DockerHub') {
            website_container.push()
        }
        sh "docker rmi viggy96/resume-website:latest"
    }
}
