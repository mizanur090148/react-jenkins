pipeline {
    agent any

    tools {
        nodejs 'NodeJS 18' // Use the configured Node.js tool
    }

    environment {
        NODE_ENV = 'production'
        EMAIL_RECIPIENT = 'mizanurmilon0901@gmail.com'
    }

    options {
        timeout(time: 20, unit: 'MINUTES')
        timestamps()
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning the repository...'
                git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                sh 'npm ci' // Prefer `npm ci` for CI/CD as it's faster and more reliable
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                // Uncomment and adjust the command below as needed:
                // sh 'npx jest --ci --reporters=default --reporters=jest-junit'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                sh 'npm run build'
            }
        }

        stage('Archive Artifacts') {
            steps {
                echo 'Archiving build artifacts...'
                archiveArtifacts artifacts: 'build/**', fingerprint: true
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Set the deploy.sh file as executable
                sh 'chmod +x deploy.sh'
                // Now execute the deploy.sh script
                sh './deploy.sh'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs() // Clean workspace to free up space
        }

        success {
            echo '✅ Pipeline succeeded! Artifacts archived and deployed successfully.'
            emailext (
                subject: "Build Succeeded: ${env.JOB_NAME} Build #${env.BUILD_NUMBER}",
                body: """
                    <p>Hi,</p>
                    <p>Build <b>${env.BUILD_NUMBER}</b> succeeded and was deployed successfully!</p>
                    <p>You can view the details here: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                    <p>Regards,<br/>Jenkins</p>
                """,
                to: "${env.EMAIL_RECIPIENT}",
                mimeType: 'text/html'
            )
        }

        failure {
            echo '❌ Pipeline failed! Check logs for errors.'
            emailext (
                subject: "Build Failed: ${env.JOB_NAME} Build #${env.BUILD_NUMBER}",
                body: """
                    <p>Hi,</p>
                    <p>Build <b>${env.BUILD_NUMBER}</b> failed during one of the stages.</p>
                    <p>Please check the console output for more details: <a href="${env.BUILD_URL}console">${env.BUILD_URL}console</a></p>
                    <p>Regards,<br/>Jenkins</p>
                """,
                to: "${env.EMAIL_RECIPIENT}",
                mimeType: 'text/html'
            )
        }
    }
}
