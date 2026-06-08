pipeline {
agent any

```
tools {
    nodejs 'node20'
}

stages {

    stage('Clone Code') {
        steps {
            git branch: 'main',
            credentialsId: 'github-creds',
            url: 'https://github.com/PallavSharma-oss/Restaurant-Food-Ordering-Management-System--React-MERN-FullStack.git'
        }
    }

    stage('Install Dependencies') {
        steps {
            sh 'npm install'
        }
    }

    stage('Build Project') {
        steps {
            sh 'npm run build'
        }
    }

    stage('Docker Build') {
        steps {
            sh 'docker build -t app-image .'
        }
    }

    stage('Docker Run') {
        steps {
            sh '''
            docker stop app-container || true
            docker rm app-container || true
            docker run -d -p 3000:3000 --name app-container app-image
            '''
        }
    }
}
```

}
