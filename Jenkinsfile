pipeline{
        agent any
        environment {
            app_version = 'v2'
            rollback = 'false'
        }
        stages{
            stage('Clone repo'){
                     steps{
                         sh '''
                         ssh -i ubuntu@ip-172-31-14-220
                         git clone https://github.com/ZantyDesigns/SFIA2.git
                         '''
                     }
            }

      /*
            stage('Build Image'){
                steps{
                    script{
                            if (env.rollback == 'false'){
                                 withCredentials([string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'SQLPass'), string(credentialsId: 'DATABASE_URI', variable: 'DBURI'), string(credentialsId: 'SECRET_KEY', variable: 'SECRETKEY')]) {
                                        sh '''
                                           cd SFIA2
                                           export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} SECRET_KEY=${SECRET_KEY}
                                           docker-compose build
                                           '''
                                 }
                            }
                    }
                }
            }

            stage('Tag & Push Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                                sh '''
                                cd SFIA2

                                '''
                                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials'){
                                    image.push("${env.app_version}")
                                }

                        }
                    }
               }
            }
*/
            stage('Deploy App'){
                steps{
                    sh '''
                    ssh -i ubuntu@ip-172-31-14-220
                    cd SFIA2
                    docker-compose up -d
                    '''
                }
            }
         }
   }