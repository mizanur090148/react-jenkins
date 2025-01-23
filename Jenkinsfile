pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install' // or 'yarn install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build' // or 'yarn build'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test' // or 'yarn test'
            }
        }

        stage('Deploy') {
            steps {
                // Add deployment steps here (e.g., deploying to S3, Netlify, etc.)
                sh 'echo "Deploying the React app..."'
            }
        }
    }
}
