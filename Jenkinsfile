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
                            sh '''
                            export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} DATABASE_URI=${DATABASE_URI} SECRET_KEY${SECRET_KEY}
                            sudo -n -E MYSQL_ROOT_PASSWORD=password DATABASE_URI=mysql+pymysql://admin:password@test-db.c0oxn6eqdeoq.eu-west-2.rds.amazonaws.com:3306/users SECRET_KEY=password docker-compose -d --build
                            '''

                        }
                    }
                }
            }
            stage('Tag & Push Image'){
                steps{
                    script{
                        if (env.rollback == 'false'){
                            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials'){
                                image.push("${env.app_version}")
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