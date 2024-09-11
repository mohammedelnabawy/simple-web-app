pipeline {
    agent 'any'
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
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKERPASS', usernameVariable: 'DOCKERENAME')]) {
                    sh """
                    docker login -u ${DOCKERENAME} -p ${DOCKERPASS}
                    docker pull elnabawy/simple-web-app
                    docker run -d -p 8085:80 elnabawy/simple-web-app
                    """
                }
            }
        }
    }
}
