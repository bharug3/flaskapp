<<<<<<< Updated upstream
pipeline{
    agent any
    parameters {
        choice choices: ['deploy', 'development', 'production'], description: 'Select Environment', name: 'Environment'
    }

        stages{
            stage('Deploying to development') {
		        when {
                expression {
                env.BRANCH_NAME == 'development'
                    }
                }
                    steps {
                        echo 'Deploying to development....'
                    }  
         }
            stage('Deploying to production') {
		        when {
                expression {
                env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'main'
                    }
                }
                    steps {
                        echo 'Deploying to production....'
                    }  
    }
}
}
=======
pipeline{
    agent any
    parameters {
        choice choices: ['', 'development', 'production'], description: 'Select Environment', name: 'Environment'
    }

    // stages{
    //     stage("deploy"){
    //         steps{
    //             sh '''

    //                 ls -ltrh
    //                 pwd
    //                 scp  -i /var/lib/jenkins/.ssh/productionprivatekey.pem -o StrictHostKeyChecking=no -r * ec2-user@52.27.179.91:~/
    //                 ssh -i /var/lib/jenkins/.ssh/productionprivatekey.pem  -o StrictHostKeyChecking=no ec2-user@52.27.179.91 bash flaskservice.sh stop
    //                 ssh -i /var/lib/jenkins/.ssh/productionprivatekey.pem  -o StrictHostKeyChecking=no ec2-user@52.27.179.91 bash flaskservice.sh start
    //                 '''
    //         }
    //     }
        stage('Deploying to Test') {
		    when {
            expression {
            return params.ENVIRONMENT == 'development'
                    }
                }
                steps {
                    echo 'Deploying to development....'
                    }  
         }
         stage('Deploying to production') {
		    when {
            expression {
            return params.ENVIRONMENT == 'master' || env.BRANCH_NAME == 'main'
                    }
                }
                steps {
                    echo 'Deploying to production....'
                    }  
    }
}
}
>>>>>>> Stashed changes
