pipeline{
    agent {label "dev-server"}
    
    stages{
        stage("Code Checkout"){
            steps{
                echo 'Code Checkout Started'
                git branch: 'main', credentialsId: 'Github-PAT', url: 'https://github.com/vivek-kp-97/flask_app.git'
            }
        }
        stage("Build"){
            steps{
		echo "Image Build Started"
                sh "docker build -t flask-app ."
            }
        }
        stage("Push Image"){
            steps{
		echo "Image Push Started"
                withCredentials([usernamePassword(credentialsId:"Dockerhub",passwordVariable:"dockerhubPass",usernameVariable:"dockerhubUsername")]){
                    sh "docker login -u ${env.dockerhubUsername} -p ${env.dockerhubPass}"
                    sh "docker tag flask-app:latest ${env.dockerhubUsername}/flask-app:latest"
                    sh "docker push ${env.dockerhubUsername}/flask-app:latest"
                }
            }
        }
        stage("Deploy"){
            steps{
		echo "Deployment Started"
                sh "docker compose down && docker compose up -d"
            }
        }
    }
}
