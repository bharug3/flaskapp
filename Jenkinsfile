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
                    scp -r ec2-user@54.186.169.235:/var/lib/jenkins/workspace/flaskapp ec2-user@54.185.5.87:/home/ec2-user
                    ssh develop flaskservice.sh stop
                    ssh deve flaskservice.sh start
                    '''
            }
        }
    }
}