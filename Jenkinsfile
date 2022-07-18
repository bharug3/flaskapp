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
