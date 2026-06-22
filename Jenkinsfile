pipeline {
    agent any

    environment {
        FRONTEND_IP = "13.232.243.79"
        BACKEND_IP  = "15.206.81.86"

        REPO_URL  = "https://github.com/PallavSharma-oss/Restaurant-Food-Ordering-Management-System--React-MERN-FullStack-main.git"
        REPO_PATH = "~/Restaurant-Food-Ordering-Management-System--React-MERN-FullStack-main"

        SCANNER_HOME = tool 'SonarScanner'
    }

    stages {

        stage('Build') {

            steps {

                echo "========== BUILD STAGE =========="

                git branch: 'main',
                    credentialsId: 'github-creds',
                    url: "${REPO_URL}"

                sh '''
                echo "Building Backend Docker Image..."

                cd food-ordering-backend

                docker build -t food-ordering-backend .

                cd ..

                echo "Building Frontend Docker Image..."

                cd food-ordering-frontend

                docker build -t food-odering-frontend .

                cd ..

                echo "Build Completed Successfully."
                '''
            }
        }

        stage('Test') {

            steps {

                echo "========== TEST STAGE =========="

                withCredentials([
                    string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')
                ]) {

                    sh """
                    ${SCANNER_HOME}/bin/sonar-scanner \
                    -Dsonar.token=\$SONAR_TOKEN
                    """
                }

                sh '''
                echo "Checking Docker Images..."

                docker image inspect food-ordering-backend

                docker image inspect food-odering-frontend

                docker images

                echo "Test Stage Completed."
                '''
            }
        }```groovy
stage('Test') {

    steps {

        echo "========== SONARCLOUD ANALYSIS =========="

        withCredentials([
            string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN')
        ]) {

            sh '''
            docker run --rm \
              -e SONAR_TOKEN=$SONAR_TOKEN \
              -v $PWD:/usr/src \
              sonarsource/sonar-scanner-cli:latest \
              sonar-scanner \
                -Dsonar.token=$SONAR_TOKEN
            '''
        }

        sh '''
        echo "Checking Docker Images..."

        docker image inspect food-ordering-backend

        docker image inspect food-odering-frontend
        '''
    }
}
```


        stage('Deploy') {

            steps {

                echo "========== DEPLOY STAGE =========="

                withCredentials([
                    sshUserPrivateKey(
                        credentialsId: 'aws-ssh',
                        keyFileVariable: 'SSH_KEY',
                        usernameVariable: 'SSH_USER'
                    )
                ]) {

                    sh """
                    echo "Deploying Backend..."

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

                    sh """
                    echo "Deploying Frontend..."

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

            echo "=========================================="
            echo "CI/CD PIPELINE EXECUTED SUCCESSFULLY"
            echo "=========================================="

        }

        failure {

            echo "=========================================="
            echo "CI/CD PIPELINE FAILED"
            echo "=========================================="

        }

        always {

            echo "Pipeline Finished"

        }
    }
}