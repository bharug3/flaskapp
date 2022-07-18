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
                    scp -i ~/.ssh/productionsystem.pem -r ec2-user@35.161.158.3:/var/lib/jenkins/workspace/flaskapp ec2-user@52.27.179.91:~/
                    ssh -i production flaskservice.sh stop
                    ssh -i production flaskservice.sh start
                    '''
            }
        }
    }
}