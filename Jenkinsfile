def codeR=0
pipeline {
    agent any
    
    environment {
        scriptHOME="D:\\labs\\PS\\pipeline"
    }
    
	stages {
		stage('BUILD'){
			steps {
				script {
					waitUntil {
						count = (binding.hasVariable('count')) ? count + 1 : 1
                        countMax = 3
                        println "try: $count"
						
						//						
						powershell '''
							cd $ENV:scriptHOME
							Invoke-Expression ".\\PSFile.ps1 -env RBB"
						'''
						
						echo "Code retour log AVT : ${codeR}"
						codeR=powershell returnStdout: true, script:"Invoke-Command -ScriptBlock{$scriptHOME\\PSAnalyseLog.ps1}"
						
						echo "Code retour log APR : ${codeR}"
						buildOK = codeR ==~ /(?s).*0*/
						
						println "buildOK: $buildOK"
						
						if (buildOK) {
							return true     // success, so exit loop
						} else {
							if (count >= countMax) {
								// count exceeds threshold, so throw an error (exits pipeline)
								error "Retried $count times. Giving up..."
							}
							// wait a bit before retrying
							sleep time: 2, unit: 'SECONDS'
							return false    // repeat loop
						}
					}
				}
			}    
		}
	}    
}