pipeline {
    agent any

    environment {
        FRONTEND_IP = "13.232.243.79"
        BACKEND_IP  = "15.206.81.86"
        REPO_PATH   = "~/Restaurant-Food-Ordering-Management-System--React-MERN-FullStack-main"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-creds',
                    url: 'https://github.com/PallavSharma-oss/Restaurant-Food-Ordering-Management-System--React-MERN-FullStack-main.git'
            }
        }

        stage('Deploy Backend') {
            steps {
                withCredentials([
                    sshUserPrivateKey(
                        credentialsId: 'aws-ssh',
                        keyFileVariable: 'SSH_KEY',
                        usernameVariable: 'SSH_USER'
                    )
                ]) {

                    sh """
ssh -i \$SSH_KEY -o StrictHostKeyChecking=no \$SSH_USER@${BACKEND_IP} '
cd ${REPO_PATH}

git pull

cd food-ordering-backend

sudo docker rm -f backend || true

sudo docker build -t food-ordering-backend .

sudo docker run -d \
    --name backend \
    --restart always \
    -p 5000:5000 \
    --env-file .env \
    food-ordering-backend
'
"""
                }
            }
        }

        stage('Deploy Frontend') {
            steps {
                withCredentials([
                    sshUserPrivateKey(
                        credentialsId: 'aws-ssh',
                        keyFileVariable: 'SSH_KEY',
                        usernameVariable: 'SSH_USER'
                    )
                ]) {

                    sh """
ssh -i \$SSH_KEY -o StrictHostKeyChecking=no \$SSH_USER@${FRONTEND_IP} '
cd ${REPO_PATH}

git pull

cd food-ordering-frontend

sudo docker rm -f frontend || true

sudo docker build -t food-odering-frontend .

sudo docker run -d \
    --name frontend \
    --restart always \
    -p 80:80 \
    food-odering-frontend
'
"""
                }
            }
        }

    }

    post {
        success {
            echo "====================================="
            echo "Deployment Completed Successfully"
            echo "====================================="
        }

        failure {
            echo "====================================="
            echo "Deployment Failed"
            echo "====================================="
        }
    }
}