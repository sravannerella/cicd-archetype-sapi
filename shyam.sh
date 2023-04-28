  pipeline {
      agent any

      tools {
          // Install the Maven version configured as "M3" and add it to the paths.
          maven "maven-3.6.3"
      }

  stages {
          stage('Build') 
          
          {
              steps 
                  {

                  // Run Maven on a Unix agent.
                  sh "mvn clean install"
              }

          }
            stage('Test')   
          {
              steps 
                  {

                  // Run Maven on a Unix agent.
                  sh "mvn clean test"
              }

          }
           stage('Deploy') 
          
          {
              steps 
                  {

                  // Run Maven on a Unix agent.
                  sh "mvn clean deploy -DaltDeploymentRepository=myinternalrepo::default::file:///C:/snapshots"
              }

          }

    }
  }

  