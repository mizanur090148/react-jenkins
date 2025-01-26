node {
    stage('SCM Checkout') {
        // Use the Git step directly
        git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
    }
    
    stage('Compile-Package') {
        // Set up Maven tool and environment
        def mavenHome = tool name: 'Default', type: 'maven'
        env.PATH = "${mavenHome}/bin:${env.PATH}"
        
        // Run Maven package command
        sh 'mvn package'
    }
}
