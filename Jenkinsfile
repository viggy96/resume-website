node {
    checkout scm
    def website_container = docker.build("viggy96/resume-website:latest", "--network dev_default .")

    stage('Build') {
        website_container.inside {
            sh 'hugo --minify'
        }
    }
    
    stage('Test') {
        website_container.inside {
            sh  'hugo serve --baseURL localhost--bind 0.0.0.0'
        }
    }

    stage('Deploy') {
        website_container.push()
    }
    
}
