pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'saidharshan706'
        IMAGE_NAME = 'cicd-demo-app'
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/SAIDHARSHAN75/cicd-demo.git'
            }
        }

        stage('Verify Workspace') {
            steps {
                echo 'Listing all files in workspace:'
                sh 'ls -R'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKERHUB_USER/$IMAGE_NAME:latest .'
            }
        }

        stage('Push to DockerHub') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'dockerhub-token', 
            usernameVariable: 'DOCKERHUB_USER', 
            passwordVariable: 'DOCKERHUB_PASS'
        )]) {
            sh 'echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin'
            sh 'docker push $DOCKERHUB_USER/$IMAGE_NAME:latest'
        }
    }
}

        stage('Deploy to Kubernetes') {
            steps {
                sh 'ls -l k8s-deployment.yaml'
                sh 'kubectl apply -f k8s-deployment.yaml'
            }
        }
    }
}
