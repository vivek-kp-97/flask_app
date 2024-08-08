pipeline{
    agent any
    
    stages{
        stage("Code Checkout"){
            steps{
                echo 'Code Checkout Started'
                git branch: 'main', credentialsId: 'Github-PAT', url: 'https://github.com/vivek-kp-97/flask_app.git'
            }
        }
        stage("Build"){
            steps{
                sh "docker build -t flask-app ."
            }
        }
        stage("Push Build"){
            steps{
                withCredentials([usernamePassword(credentialsId:"Dockerhub",passwordVariable:"dockerhubPass",usernameVariable:"dockerhubUsername")]){
                    sh "docker login -u ${env.dockerhubUsername} -p ${env.dockerhubPass}"
                    sh "docker tag flask-app:latest ${env.dockerhubUsername}/flask-app:latest"
                    sh "docker push ${env.dockerhubUsername}/flask-app:latest"
                }
            }
        }
        stage("Deploy"){
            steps{
                sh "docker compose down && docker compose up -d"
            }
        }
    }
}