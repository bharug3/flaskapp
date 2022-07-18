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
                    scp -i ~/.ssh/productionsystem.pem -r ~/var/lib/jenkins/workspace/flaskapp ec2-user@52.27.179.91:~/
                    ssh production flaskservice.sh stop
                    ssh production flaskservice.sh start
                    '''
            }
        }
    }
}