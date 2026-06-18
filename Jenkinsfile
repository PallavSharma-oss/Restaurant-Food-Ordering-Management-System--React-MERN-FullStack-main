pipeline {
    agent any

    environment {
        SCANNER_HOME = "/opt/sonar-scanner/bin"
        SONAR_TOKEN = credentials('sonar-token')
    }

    stages {

        stage('Build') {
            steps {
                echo 'Cloning project...'

                git branch: 'main',
                credentialsId: 'github-creds',
                url: 'https://github.com/PallavSharma-oss/Restaurant-Food-Ordering-Management-System--React-MERN-FullStack-main.git'

                sh '''
                cd food-ordering-frontend
                rm -rf node_modules package-lock.json
                npm install --legacy-peer-deps
                npm run build
                '''
            }
        }

        stage('Test - SonarCloud') {
            steps {
                sh '''
                /opt/sonar-scanner/bin/sonar-scanner \
                -Dsonar.projectKey=pallav-sharma_sharma-pallav \
                -Dsonar.organization=pallav-sharma \
                -Dsonar.sources=. \
                -Dsonar.host.url=https://sonarcloud.io \
                -Dsonar.token=$SONAR_TOKEN
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                ssh -o StrictHostKeyChecking=no \
                -i /home/ubuntu/keys/jenkins-key.pem \
                ubuntu@FRONTEND_PUBLIC_IP << 'EOF'

                docker stop frontend-container || true
                docker rm frontend-container || true

                rm -rf ~/frontend-app

                git clone https://github.com/PallavSharma-oss/Restaurant-Food-Ordering-Management-System--React-MERN-FullStack-main.git ~/frontend-app

                cd ~/frontend-app/food-ordering-frontend

                rm -rf node_modules package-lock.json
                npm install --legacy-peer-deps
                npm run build

                docker build -t food-frontend .

                docker run -d -p 3000:3000 \
                --name frontend-container \
                food-frontend

EOF
                '''
            }
        }
    }
}
