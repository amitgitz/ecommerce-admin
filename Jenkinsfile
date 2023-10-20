pipeline {
    agent any
    
    environment {
        // Define environment variables here, if needed
        NODE_VERSION = '14'
        NPM_VERSION = '6'
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from your Git repository
                script {
                    checkout scm
                }
            }
        }
        
        stage('Install Dependencies') {
            steps {
                // Use specific Node and NPM versions
                tools {
                    nodejs "${NODE_VERSION}"
                    npm "${NPM_VERSION}"
                }
                // Install dependencies
                sh 'npm install'
            }
        }
        
        stage('Build') {
            steps {
                // Build the Next.js app
                sh 'npm run build'
            }
        }
        
        stage('Test') {
            steps {
                // Add any tests you want to run here
                // For example: sh 'npm test'
            }
        }
        
        stage('Deploy') {
            steps {
                // Add deployment steps here
                // For example, if deploying to a server:
                // sh 'rsync -avz build/ user@your-server:/path/to/your/app/'
            }
        }
    }
    
    post {
        always {
            // Clean up after the build
            sh 'npm ci'
        }
    }
}
