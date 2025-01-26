node {
    stage('SCM Checkout') {
        // Checkout the code using the Git plugin
        git branch: 'main', url: 'https://github.com/mizanur090148/react-jenkins.git'
    }
    
    stage('Compile-Package') {
        // Configure Maven and add it to the environment PATH
        def mavenHome = tool name: 'Default', type: 'maven'
        env.PATH = "${mavenHome}/bin:${env.PATH}"
        
        // Run the Maven command
        sh 'mvn package'
    }
}
