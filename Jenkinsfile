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
        // stage('cd') {
        //     steps {
        //        withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'DOCKERPASS', usernameVariable: 'DOCKERENAME')]) {
        //             sh """
        //             docker login -u ${DOCKERENAME} -p ${DOCKERPASS}
        //             kubectl delete deployment --all -n simple-web
        //             kubectl apply -f namespace.yaml
        //             kubectl apply -f deployment.yaml
        //             kubectl apply -f svc.yaml
        //             """
        //        }
        //     }
        }
    }
}
