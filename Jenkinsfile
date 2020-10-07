pipeline{
        agent any
        environment {
            app_version = 'v2'
            rollback = 'false'
        }
        stages{
            stage('Build Image'){
                steps{
                    script{
                            if (env.rollback == 'false'){
                                 withCredentials([string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'SQLPass'), string(credentialsId: 'DATABASE_URI', variable: 'DBURI'), string(credentialsId: 'SECRET_KEY', variable: 'SECRETKEY')]) {
                                        sh '''
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
                            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials'){
                                sh
                                '''
                                docker-compose push
                                '''
                            }
                        }
                    }
                }
            }
            stage('Deploy App'){
                steps{
                    sh "docker-compose pull && docker-compose up -d"
                }
            }
        }
}