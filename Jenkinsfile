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
                 sh 'ansible -i ec2.py -m ping tag_Name_development --private-key ~/.ssh/development.pem'
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
                 sh 'ansible -i ~/ec2.py -m ping tag_Name_development --private-key ~/.ssh/development.pem'
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
                ansible -i ec2.py -m ping tag_Name_development --private-key ~/.ssh/production.pem
            }  
        }
    }
}
