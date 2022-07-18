pipeline{
    agent any
    
        stages{
		
	    stage('Deploying to main') {
		        when {
                expression {
                env.BRANCH_NAME == 'main'
                    }
                }
                    steps {
                        echo 'Deploying to production....'
                    }  
    }
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
                env.BRANCH_NAME == 'production'
                    }
                }
                    steps {
                        echo 'Deploying to production....'
                    }  
    }
}
}
