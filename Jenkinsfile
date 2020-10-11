 pipeline {
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
                          withCredentials([string(credentialsId: 'DATABASE_URI', variable: 'DBURI'), string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'SQLPASS'), string(credentialsId: 'SECRET_KEY', variable: 'SECRET'), file(credentialsId: 'TEST_PEM', variable: 'TEST_PEM')]) {
                               sh '''
                                  # SSH into testing-vm
                                  ssh -tt -o "StrictHostKeyChecking=no" -i $TEST_PEM ubuntu@ec2-18-134-4-66.eu-west-2.compute.amazonaws.com << EOF
                                  #remove repository if exists then clone down the most recent repo
                                  #remove the repo if it already exists
                                  rm -rf SFIA2
                                  #clone most recent repo
                                  git clone https://github.com/ZantyDesigns/SFIA2.git
                                  #make active repo
                                  cd SFIA2
                                  #export database variables
                                  export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
                                  export DATABASE_URI=${DATABASE_URI}
                                  export SECRET_KEY=${SECRET_KEY}
                                  # build project using docker-compose and environment variables
                                  sudo -E MYSQL_ROOT_PASSWORD=$SQLPASS DATABASE_URI=$DBURI SECRET_KEY=$SECRET docker-compose up -d --build
                                  exit
                                  >> EOF
                                  '''
                          }
                     }
                 }
             }
        }
            stage('Test Build and Database'){
                     steps{
                         script{
                             if (env.rollback == 'false'){
                                  withCredentials([string(credentialsId: 'DATABASE_URI', variable: 'DBURI'), string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'SQLPASS'), string(credentialsId: 'SECRET_KEY', variable: 'SECRET'), file(credentialsId: 'TEST_PEM', variable: 'TEST_PEM')]) {
                                       sh '''
                                          # SSH into testing-vm
                                          ssh -tt -o "StrictHostKeyChecking=no" -i $TEST_PEM ubuntu@ec2-18-134-4-66.eu-west-2.compute.amazonaws.com << EOF
                                          #make active repo
                                          cd SFIA2
                                          #export database variables
                                           export MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
                                           export DATABASE_URI=${DATABASE_URI}
                                           export SECRET_KEY=${SECRET_KEY}
                                          # test front and backend using pytest and database variables
                                          sudo -E MYSQL_ROOT_PASSWORD=$SQLPASS DATABASE_URI=$DBURI SECRET_KEY=$SECRET docker-compose exec -T frontend pytest --cov=application
                                          sudo -E MYSQL_ROOT_PASSWORD=$SQLPASS DATABASE_URI=$DBURI SECRET_KEY=$SECRET docker-compose exec -T backend pytest --cov=application
                                          exit
                                          >> EOF
                                          '''
                                  }
                             }
                         }
                     }
                }
     }
 }