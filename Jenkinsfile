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
                    cd ../../..
                    pwd
                    cd .ssh
                    pwd
                    scp -i .ssh/productionprivatekey.pem -r flaskapp ec2-user@52.27.179.91:~/
                    ssh Production flaskservice.sh stop
                    ssh Production flaskservice.sh start
                    '''
            }
        }
    }
}