pipeline {
    agent {
        label 'aws'
    }

    stages {
        
        stage('ci') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKERPASS', usernameVariable: 'DOCKERENAME')]) {
                    sh """ 
                    docker build . -t elnabawy/simple-web-app
                    docker login -u ${DOCKERENAME} -p ${DOCKERPASS}
                    docker push elnabawy/simple-web-app
                    """
                }
            }
        }
        stage('cd') {
            steps {
                    sh """ 
                    docker run -d -p 8086:80 elnabawy/simple-web-app
                    """
            }
        }
    }
}
