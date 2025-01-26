node {
    stage('SCM Checkout') {
        // Using the Git tool installed in Jenkins
        def gitHome = tool name: 'Default', type: 'git'
        env.PATH = "${gitHome}/bin:${env.PATH}" // Add Git to PATH
        git 'https://github.com/mizanur090148/react-jenkins.git'
    }

    stage('Compile-Package') {
        // Using the Maven tool installed in Jenkins
        def mavenHome = tool name: 'Default', type: 'maven'
        env.PATH = "${mavenHome}/bin:${env.PATH}" // Add Maven to PATH
        sh 'mvn package'
    }
}
