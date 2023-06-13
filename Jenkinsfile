pipeline {
    agent {
        node {
            label 't055-runner'
        }
    }
    
    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'ca-git-access', branch: 'development', url: 'https://git.cloudavise.com/visops/t055/full-stack-app.git'
            }
        }
        
        stage('Installation') {
            steps {
                script {
                    sh '''
                        ansible-vault decrypt --vault-id /home/ubuntu/tmp/vault-id jenkins-key.pem
                        chmod 400 jenkins-key.pem
                        ansible-playbook -i inventory full-stack.yml
                    '''
                }
            }
        }
    }
}

