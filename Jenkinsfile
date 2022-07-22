pipeline{
    agent any
    stages{
        stage('Deploying to main'){
            when {
                expression{
                    env.BRANCH_NAME == 'main'
                }
            }
            steps{
                echo 'Deploying to main....'
                 sshagent(['ec2_ssh_usage']) 
                    {
                    sh 'ansible -i ec2.py -m ping tag_Name_development 
                    }
                }  
            }
        stage('Deploying to development'){
            when{
                expression {
                    env.BRANCH_NAME == 'development'
                }
            }
            steps{
                echo 'Deploying to development....'
                sshagent(['ec2_ssh_usage'])
                   
                    {
                     sh 'ansible -i ~/ec2.py -m ping tag_Name_development 
                    }
            }  
        }
        stage('Deploying to production'){
            when{
                expression {
                    env.BRANCH_NAME == 'production'
                }
            }
            steps {
                echo 'Deploying to production....'
                sshagent(['ec2_ssh_usage']) 
                    {
                    sh 'ansible -i ec2.py -m ping tag_Name_development
                    }
                
            }  
        }
    }
}
