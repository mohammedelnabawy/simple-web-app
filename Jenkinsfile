pipeline {
    agent {
        label 'slave'
    }

    stages {
        
        stage('ci') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKERPASS', usernameVariable: 'DOCKERENAME')]) {
                    sh """ 
                    docker build . -t elnabawy/simple-web-app
                    docker login -u ${DOCKERENAME} -p ${DOCKERPASS}
                    docker push elnabawy/-web-app
                    """
                }
            }
        }
        stage('cd') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKERPASS', usernameVariable: 'DOCKERENAME')]) {
                    sh """
                    docker login -u ${DOCKERENAME} -p ${DOCKERPASS}
                    kubectl apply -f bake-namespace.yaml
                    kubectl apply -f bake-deploy.yaml
                    kubectl apply -f bake-svc.yaml
                    """
                }
            }
        }
    }
}
