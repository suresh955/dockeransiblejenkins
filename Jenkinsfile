pipeline{ 
    agent any
    
   stages{
       
        stage('SCM'){
            steps{
                git credentialsId: 'git',
                url: 'https://github.com/suresh955/dockeransiblejenkins.git'
            }
        }
        
        stage('Maven Build'){
            steps{
                sh "mvn clean package "
            }
        }
        stage('build docker image'){
            steps{
                sh "docker build . -t hello-world:${BUILD_NUMBER}"
            }
            
        } 
       stage('login to ecr'){
           steps{
               script{
               sh "aws ecr get-login-password --region us-east-2 |docker login -u AWS -p eyJwYXlsb2FkIjoibStmaDFJUzdZcDZxeFA0eTFMU2F4aVpkZDVCTlNRcVF6b1paRHozTFhqeU5VV1VTS3RnV2ZIeDdFenZZU2EwdzhZL3E5ckQ1OFlWVFQxVzVJN3doOHJQR3c0R0RJV3JGU2FjcXozMVltUERrTXNCeGRUR3RnRDh3c2RJNWE4cFdtbXp1Qko2S1J0NERxcjVwTURUTlpMNFQ5aitEZjNKM3N5aXgxTlBKbitqcE9heTI1aTFBQWxnUW9UVHdVejJKdDdEWjJIMWV2OVNabWtSYjRlVTdGNm1vdGJXWjZ5RGdTeWRCL2xTSUloUFQ1VzhIWlVWRlp4aURxSjkyTXFVMDgrMUJIU3I0NU1CWXVHUTFRZGVHTlluN1k4NTA0YUR6VldZR3FtOUx5STIyMXkxang2b2ZTU3BIZjNTN3RvWE5pai8reHc1QlAwNmRyUXQrdExsUXh1RGNyb3JJVUhmalNaLzhDUHhzWThvc3hjdkJoYzc4SXBBVGdkZnlBSUhMQ21KWHRHbHZXZ0ozOUZIcTAvQUJOMVZtZXNtdGZSVkIwaXlWSlUzVnliZkRqUjFYSDVTMFl0VVg2eXNoY1ZtdnhYRXJUdGhzbW1wZ0w0RXBEY3BlNkdPN2pLaFc3THFmbUVBU1ZKc3VMUDV3U3dDbExCdHppSEZobmVhTGZnZlNyRHJBcElhZFVNQVZnR0I3NzdiV3FuaitwMWQrcTQvNGRaY2h2cmo0T05lWHRrL0paMHdIL0Z4dnRkTnM3N2tXZytDRDVNSWN4OXV0Q0ZVQ2FHVmxvd0xkMGNLbm9WSnYvYUVsaGJTbDhqbnVFTWIzUjFxcDdQS09CRlo0SGNkMkR6aktQRjhuOFBxU0NzcUg1U0ZyNExmenNFVFFtL2FURVpzSDVTVHRXdGpNdzJ2L3BCeEdqMEYrNk5HbDBTMzI2RVF6cWRnVXpxNlBoK2JxaEIvY3I4eUgrcktKcHZ5QjVmVjZUVWJ4OXhBMzZIei96TmlOemtId3RZYjhYMlJsVXZNYTlLWTE3eWJRZ21kU3NJaFVGK1hUbDcyampSdC9pVzg2VTZ4ajF1OE42UUFka2RJc0RZMDljZjJZdUVqenZoZWljY09tMEV2RjcwdU5ZRjVQNVUreHNxaHR4STBTUmhqTDEvVkVaS1hIUjVSb0xXR3JlcnpSYVhOdnZuV0h4WllCeFBOUm93a3BxSjlzRWZORS93c08yajhveENDamw0eGhKeWQzUVQ5OUwzUjF0b3VKU2hpSkNKT2hFTmorblk2OFpmR0FrSW5RelNWWTlIQk5LbllESUdpRkg3L3BzNVlwQVRlR2xqR0Mrbm41VzlqTHFiQUVnaU16Z1VlVXdPSjlSQWo0VU1xaWxxTnpTdHdVeGtIU2RVcTBXZ0NRUXc9PSIsImRhdGFrZXkiOiJBUUVCQUhqQjcvaWd3TWc0TlB3YXVyeFNJWXg0SGZueHVHYy80OGJEd3Z3RHBOWVdaZ0FBQUg0d2ZBWUpLb1pJaHZjTkFRY0dvRzh3YlFJQkFEQm9CZ2txaGtpRzl3MEJCd0V3SGdZSllJWklBV1VEQkFFdU1CRUVETTlFVkJ0OExIc3QvYlpHSmdJQkVJQTcvellSanBDM0tkdzU4ZG5XcnphbDFxRHU1YzRkdWt1L2VZL2duTHZNaHFFRnVGY2h3aitGTFFaZ05oaWhVSjZqbUpmY05SNkdUb3RFMlZZPSIsInZlcnNpb24iOiIyIiwidHlwZSI6IkRBVEFfS0VZIiwiZXhwaXJhdGlvbiI6MTY0MDc5NDcxNX0= 147023380632.dkr.ecr.us-east-2.amazonaws.com" 
               }
           }
       }
        stage('push to ecr'){
            steps{
                script{
                    sh "docker tag hello-world:${BUILD_NUMBER} 147023380632.dkr.ecr.us-east-2.amazonaws.com/hello-world:${BUILD_NUMBER}"
                    sh "docker push 147023380632.dkr.ecr.us-east-2.amazonaws.com/hello-world:${BUILD_NUMBER} "
                }
            }
        }
        
    
   }
}
