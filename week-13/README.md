##Overview of the workshop

The idea of ​​this workshop is to use Elastic Beanstalk and GitFlow practice (create 2 long lived branches (master and develop) as well as another short lived branch (feature) for features) to automate the process where the creation of the branch would trigger the creation of a new Elastic Beanstalk environment on which the version of the code in the Codecommit repository that is on the corresponding branch would be deployed. 

Using the Lambda functions, any change in the repository, related to branches, will trigger a function to either create or delete the EB environment and pipeline (through Codepipeline) for that branch. Every code change in the repository will trigger a pipeline that will deploy the changes to the appropriate environment.

Summary of this workshop is to show the effectiveness of using Elastic Beanstalk to quickly enable the deployment of code as well as the automation of the entire process of changes in the repository, both from the changes to the code on the branch itself (which would be used to deploy the changes to the appropriate environment) and to changes related to branches where creating a new branch entails automatically creating a new environment and deploying code from that branch to it. The same applies to merging and deleting a branch, its removal removes the entire environment as well as pipelines



