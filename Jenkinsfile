pipeline {
    agent {
        label 'slave_2'
    }

    stages {
        
        stage('ci') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKERPASS', usernameVariable: 'DOCKERENAME')]) {
                    sh """ 
                    sudo docker build . -t elnabawy/simple-web-app
                    sudo docker login -u ${DOCKERENAME} -p ${DOCKERPASS}
                    sudo docker push elnabawy/simple-web-app
                    """
                }
            }
        }
        stage('cd') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKERPASS', usernameVariable: 'DOCKERENAME')]) {
                    sh """
                    sudo docker login -u ${DOCKERENAME} -p ${DOCKERPASS}
                    sudo docker run -d -p 8089:80 elnabawy/simple-web-app
                    """
                }
            }
        }
    }
}
