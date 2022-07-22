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
                    sh 'ansible -i ec2.py -m ping tag_Name_main'
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
                withCredentials([sshUserPrivateKey(credentialsId: 'ec2_ssh_usage', keyFileVariable: 'ec2')])
                    {
                    sh 'chmod +x ec2.py'   
                    cat ${ec2}
                    sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible -i ec2.py -m ping tag_Name_development --private-key ${ec2}'
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
                    sh 'ansible -i ec2.py -m ping tag_Name_development'
                    }
                
            }  
        }
    }
}
