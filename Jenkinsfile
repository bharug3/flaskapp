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
                    pwd
                    scp  -i productionprivatekey.pem -o StrictHostKeyChecking=no -r flaskapp ec2-user@52.27.179.91:~/
                    ssh -o StrictHostKeyChecking=no Production flaskservice.sh stop
                    ssh -o StrictHostKeyChecking=no Production flaskservice.sh start
                    '''
            }
        }
    }
}