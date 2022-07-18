pipeline{
    agent any
    parameters {
        choice choices: ['', 'develop', 'prod'], description: 'Select Environment', name: 'Environment'
    }

    stages{
        stage("deploy"){
            steps{
                sh '''
                    whoami
                    env
                    ls -ltrh
                    pwd
                    scp  -i /var/lib/jenkins/.ssh/productionprivatekey.pem -o StrictHostKeyChecking=no -r * ec2-user@52.27.179.91:~/
                    ssh -o StrictHostKeyChecking=no Production flaskservice.sh stop
                    ssh -o StrictHostKeyChecking=no Production flaskservice.sh start
                    '''
            }
        }
    }
}