pipeline {
    agent any

    tools {
        nodejs 'NodeJS 18'
    }

    environment {
        NODE_ENV = 'production'
        EMAIL_RECIPIENT = 'mizanur090148@gmail.com'
        BUILD_STATUS = '' // To store build status for notifications
    }

    options {
        timeout(time: 20, unit: 'MINUTES')
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '10')) // Keep only the last 10 builds
        disableConcurrentBuilds() // Prevent concurrent builds
    }

    parameters {
        choice(name: 'DEPLOY_ENV', choices: ['dev', 'staging', 'production'], description: 'Select the deployment environment')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Run tests during the pipeline')
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
                sh 'npm ci'
            }
        }

        stage('Run Tests') {
            when {
                expression { params.RUN_TESTS == true }
            }
            steps {
                echo 'Running tests...'
                sh 'npx jest --ci --reporters=default --reporters=jest-junit'
                junit 'junit.xml' // Publish test results
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                sh 'npm run build'
            }
        }

        stage('Static Code Analysis') {
            steps {
                echo 'Running static code analysis...'
                sh 'npm run lint' // Example: Run ESLint
                // You can integrate tools like SonarQube here
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
                echo "Deploying the application to ${params.DEPLOY_ENV}..."
                script {
                    if (params.DEPLOY_ENV == 'production') {
                        // Add additional checks or approvals for production deployment
                        input message: "Deploy to production? Confirm to proceed.", ok: 'Deploy'
                    }
                    sh 'chmod +x deploy.sh'
                    sh './deploy.sh'
                }
            }
        }

        stage('Test Email') {
            steps {
                script {
                    echo "Sending test email to ${env.EMAIL_RECIPIENT}"
                    mail (
                        subject: "Test Email from Jenkins",
                        body: """
                            <p>This is a test email sent from Jenkins.</p>
                            <p>If you received this email, the email configuration is working correctly.</p>
                        """,
                        to: "${env.EMAIL_RECIPIENT}",
                        mimeType: 'text/html'
                    )
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
            script {
                // Set build status for notifications
                env.BUILD_STATUS = currentBuild.currentResult
            }
        }

        success {
            echo "Sending success email to ${env.EMAIL_RECIPIENT}"
            mail (
                subject: "Build Succeeded: ${env.JOB_NAME} Build #${env.BUILD_NUMBER}",
                body: """
                    <p>Hi,</p>
                    <p>Build <b>${env.BUILD_NUMBER}</b> succeeded and was deployed successfully to <b>${params.DEPLOY_ENV}</b>!</p>
                    <p>You can view the details here: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                    <p>Regards,<br/>Jenkins</p>
                """,
                to: "${env.EMAIL_RECIPIENT}",
                mimeType: 'text/html'
            )
        }

        failure {
            echo '❌ Pipeline failed! Check logs for errors.'
            mail (
                subject: "Build Failed: ${env.JOB_NAME} Build #${env.BUILD_NUMBER}",
                body: """
                    <p>Hi,</p>
                    <p>Build <b>${env.BUILD_NUMBER}</b> failed during one of the stages.</p>
                    <p>Please check the console output for more details: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                    <p>Regards,<br/>Jenkins</p>
                """,
                to: "${env.EMAIL_RECIPIENT}",
                mimeType: 'text/html'
            )
        }

        unstable {
            echo 'Build is unstable. Check test results.'
            mail (
                subject: "Build Unstable: ${env.JOB_NAME} Build #${env.BUILD_NUMBER}",
                body: """
                    <p>Hi,</p>
                    <p>Build <b>${env.BUILD_NUMBER}</b> is unstable due to test failures.</p>
                    <p>Please check the test results here: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                    <p>Regards,<br/>Jenkins</p>
                """,
                to: "${env.EMAIL_RECIPIENT}",
                mimeType: 'text/html'
            )
        }
    }
}