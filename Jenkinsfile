pipeline {
    agent any

    tools {
        nodejs 'NodeJS 18' // Use the configured Node.js tool
    }

    environment {
        NODE_ENV = 'production' // Set environment variable
    }

    options {
        timeout(time: 20, unit: 'MINUTES') // Set a timeout to avoid long-running jobs
        timestamps() // Enable timestamps for better log visibility
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    try {
                        echo 'Cloning the repository...'
                        git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
                    } catch (err) {
                        error 'Failed to checkout the repository'
                    }
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    try {
                        echo 'Installing dependencies...'
                        sh 'npm ci' // Prefer `npm ci` for CI/CD as it's faster and more reliable
                    } catch (err) {
                        error 'Dependency installation failed'
                    }
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    try {
                        echo 'Running tests...'
                        //sh 'npx jest --ci --reporters=default --reporters=jest-junit'
                    } catch (err) {
                        error 'Tests failed'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    try {
                        echo 'Building the project...'
                        sh 'npm run build'
                    } catch (err) {
                        error 'Build failed'
                    }
                }
            }
        }

        stage('Archive Artifacts') {
            steps {
                script {
                    echo 'Archiving build artifacts...'
                    archiveArtifacts artifacts: 'build/**', fingerprint: true
                }
            }
        }
    }

    post {
        always {
            script {
                echo 'Cleaning up workspace...'
                cleanWs() // Clean workspace to free up space
            }
        }

        success {
            script {
                echo '✅ Pipeline succeeded! Artifacts archived successfully.'
            }
        }

        failure {
            script {
                echo '❌ Pipeline failed! Check logs for errors.'
            }
        }
    }
}
