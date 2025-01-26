node {
    stage('SCM Checkout') {
        // Checkout the repository from Git
        git 'https://github.com/mizanur090148/react-jenkins.git'
    }
    stage('Compile-Package') {
        // Run Maven package command
        sh 'mvn clean package'
    }
}
