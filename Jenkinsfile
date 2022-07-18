pipeline{
    agent any
    parameters {
        choice choices: ['', 'develop', 'prod'], description: 'Select Environment', name: 'Environment'
    }

    stages{
        stage("deploy"){
            steps{
                sh '''
                    ls -ltrh
                    scp  -i  /home/ec2-user/.ssh/productionsystem.pem -r flaskapp  ec2-user@52.27.179.91:~/
                    ssh production flaskservice.sh stop
                    ssh production flaskservice.sh start
                    '''
            }
        }
    }
}