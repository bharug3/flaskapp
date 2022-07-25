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
                    sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible -i ec2.py -m ping "tag_Name_${BRANCH_NAME}" -u ec2-user --private-key ${ec2}'
                    sh 'pwd'
                    sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ec2.py ansible/main.yml -u ec2-user --private-key=${ec2} -e "targetHost=tag_Name_${BRANCH_NAME}"'
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
                sshagent(['ec2_ssh_production']) 
                    {
                    sh 'chmod +x ec2.py'   
                    sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible -i ec2.py -m ping "tag_Name_${BRANCH_NAME}" -u ec2-user '
                    sh 'pwd'
                    sh 'ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ec2.py ansible/main.yml -u ec2-user  -e "targetHost=tag_Name_${BRANCH_NAME}"'
                    }
                
            }  
        }
    }
}
