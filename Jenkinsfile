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
                     ~/.ssh/productionsystem.pem ec2-user@52.27.179.91:~/home/ec2-user
                    ssh -i production flaskservice.sh stop
                    ssh -i production flaskservice.sh start
                    '''
            }
        }
    }
}