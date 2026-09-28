# Stack-by-Stack Resource Breakdown

**AWS Account:** 523494594546  
**Region:** us-east-1  
**Environment:** dev

---

## 1. DomainStack-dev

### CloudFormation Resources
- `EdenCertC40BB6EF` - AWS::CertificateManager::Certificate
- `CertificateArn` - CloudFormation Output
- `ExportsOutputRefEdenCertC40BB6EF41B3D47D` - CloudFormation Export

### Purpose
Manages SSL/TLS certificates for custom domain

---

## 2. PatientMobileStack-dev

### VPC Resources
- `EdenVpc77901864` - AWS::EC2::VPC
- `EdenVpcIGW742D3D3C` - AWS::EC2::InternetGateway
- `EdenVpcVPCGW881F9123` - AWS::EC2::VPCGatewayAttachment

### Public Subnets
- `EdenVpcpublicSubnet1Subnet4269D5BA` - AWS::EC2::Subnet
- `EdenVpcpublicSubnet1RouteTableC5F28C2D` - AWS::EC2::RouteTable
- `EdenVpcpublicSubnet1RouteTableAssociation4A300A8B` - AWS::EC2::SubnetRouteTableAssociation
- `EdenVpcpublicSubnet1DefaultRouteCF39440B` - AWS::EC2::Route
- `EdenVpcpublicSubnet1EIPEE0ADBC6` - AWS::EC2::EIP
- `EdenVpcpublicSubnet1NATGateway851A4209` - AWS::EC2::NatGateway

- `EdenVpcpublicSubnet2Subnet93004782` - AWS::EC2::Subnet
- `EdenVpcpublicSubnet2RouteTable322DE4F8` - AWS::EC2::RouteTable
- `EdenVpcpublicSubnet2RouteTableAssociation57582147` - AWS::EC2::SubnetRouteTableAssociation
- `EdenVpcpublicSubnet2DefaultRoute57D63FD5` - AWS::EC2::Route

### Private Subnets
- `EdenVpcprivateSubnet1SubnetF4852413` - AWS::EC2::Subnet
- `EdenVpcprivateSubnet1RouteTable55A7F333` - AWS::EC2::RouteTable
- `EdenVpcprivateSubnet1RouteTableAssociationD448AFA6` - AWS::EC2::SubnetRouteTableAssociation
- `EdenVpcprivateSubnet1DefaultRoute0585C632` - AWS::EC2::Route

- `EdenVpcprivateSubnet2Subnet1307377A` - AWS::EC2::Subnet
- `EdenVpcprivateSubnet2RouteTableF1EBC66F` - AWS::EC2::RouteTable
- `EdenVpcprivateSubnet2RouteTableAssociation4CBEC327` - AWS::EC2::SubnetRouteTableAssociation
- `EdenVpcprivateSubnet2DefaultRouteE34AB5C1` - AWS::EC2::Route

### VPC Endpoints
- `EdenVpcSsmEndpointSecurityGroup0F358E3C` - AWS::EC2::SecurityGroup
- `EdenVpcSsmEndpoint8D1E1F93` - AWS::EC2::VPCEndpoint

- `EdenVpcSsmMessagesEndpointSecurityGroup8E11A1C8` - AWS::EC2::SecurityGroup
- `EdenVpcSsmMessagesEndpointF3638C4B` - AWS::EC2::VPCEndpoint

- `EdenVpcEc2MessagesEndpointSecurityGroupC7F3F5DC` - AWS::EC2::SecurityGroup
- `EdenVpcEc2MessagesEndpoint3B66E20D` - AWS::EC2::VPCEndpoint

- `EdenVpcSecretsManagerEndpointSecurityGroup926FD311` - AWS::EC2::SecurityGroup
- `EdenVpcSecretsManagerEndpoint99D2D2AF` - AWS::EC2::VPCEndpoint

- `EdenVpcS3Endpoint0AC250B5` - AWS::EC2::VPCEndpoint (Gateway)
- `EdenVpcDynamoDbEndpointF9A2CEB8` - AWS::EC2::VPCEndpoint (Gateway)

### Security Groups
- `AlbSg1155C1BE` - AWS::EC2::SecurityGroup
- `LambdaSg30A6108C` - AWS::EC2::SecurityGroup

### Flow Logs
- `VpcFlowLogsE6FFDEF9` - AWS::Logs::LogGroup
- `VpcFlowLogsRole6B344965` - AWS::IAM::Role
- `VpcFlowLogsRoleDefaultPolicy9C8CF3FB` - AWS::IAM::Policy
- `EdenVpcFlowLogsFlowLogBBA60587` - AWS::EC2::FlowLog

### Custom Resources
- `EdenVpcRestrictDefaultSecurityGroupCustomResource25AAADCA` - Custom::VpcRestrictDefaultSG
- `CustomVpcRestrictDefaultSGCustomResourceProviderRole26592FE0` - AWS::IAM::Role
- `CustomVpcRestrictDefaultSGCustomResourceProviderHandlerDC833E5E` - AWS::Lambda::Function

---

## 3. DDBStack-dev

### DynamoDB Tables
1. `PatientBaseMasterdevTable6561C2ED` - AWS::DynamoDB::Table
2. `DoctorBaseMasterdevTable00AB35C0` - AWS::DynamoDB::Table
3. `CheckInBaseMasterdevTableD63CE401` - AWS::DynamoDB::Table
4. `DoctorFormReldevTableF1C3A6CF` - AWS::DynamoDB::Table
5. `FormsBaseMasterdevTable0C3FE4C9` - AWS::DynamoDB::Table
6. `FormsTemplateBaseMasterdevTable9DFD7BFB` - AWS::DynamoDB::Table
7. `LocationBaseMasterdevTable2CE97B73` - AWS::DynamoDB::Table
8. `OTPBaseMasterdevTableE27A9C48` - AWS::DynamoDB::Table
9. `PatientFormReldevTable1674AC7C` - AWS::DynamoDB::Table
10. `QRBaseMasterdevTable8FB23E61` - AWS::DynamoDB::Table
11. `RedisSessiondevTable3476CD3C` - AWS::DynamoDB::Table
12. `TempSessionDatadevTable64C17204` - AWS::DynamoDB::Table

---

## 4. AuthStack-dev

### Cognito Resources
- `UserPooldevA27A8557` - AWS::Cognito::UserPool
- `UserPoolClientdev134831D7` - AWS::Cognito::UserPoolClient
- `OTPUserPooldev8ADCE680` - AWS::Cognito::UserPool
- `OTPUserPoolClientdev55FB93E8` - AWS::Cognito::UserPoolClient

### Lambda Resources
- `CustomAuthLambdadevServiceRoleB0099242` - AWS::IAM::Role
- `CustomAuthLambdadev07DBEE6C` - AWS::Lambda::Function
- `CustomAuthLambdadevCognitoInvokeBF3C2AE7` - AWS::Lambda::Permission

### IAM Resources
- `CognitoSMSRoledev2C70A19E` - AWS::IAM::Role

### Outputs
- `UserPoolIddev` - CloudFormation Output
- `UserPoolClientIddev` - CloudFormation Output
- `OTPUserPoolIddev` - CloudFormation Output
- `OTPUserPoolClientIddev` - CloudFormation Output

---

## 5. ApiKeyMgmtStack-dev

### DynamoDB
- `ApiKeysdev83C3F5C8` - AWS::DynamoDB::Table

### Secrets Manager
- `MasterKeySecretdev93A8C7F0` - AWS::SecretsManager::Secret

### Lambda
- `KeyManagementdevServiceRoleCEBA3BD2` - AWS::IAM::Role
- `KeyManagementdevServiceRoleDefaultPolicy2F7925FA` - AWS::IAM::Policy
- `KeyManagementdev94F42BEB` - AWS::Lambda::Function

### Outputs
- `ApiKeysTableNamedev` - CloudFormation Output
- `MasterKeySecretArndev` - CloudFormation Output
- `KeyManagementFunctionArndev` - CloudFormation Output

---

## 6. PatientStack-dev

### Lambda
- `PatientBackendLogGroupdev5FB7E366` - AWS::Logs::LogGroup
- `PatientBackenddevServiceRoleB65F0339` - AWS::IAM::Role
- `PatientBackenddevServiceRoleDefaultPolicy5448EBA4` - AWS::IAM::Policy
- `PatientBackenddev6C3537CB` - AWS::Lambda::Function

### Outputs
- `PatientBackenddevFnArn` - CloudFormation Output

---

## 7. DoctorStack-dev

### Lambda
- `DoctorBackendLogGroupdev49D7231E` - AWS::Logs::LogGroup
- `DoctorBackenddevServiceRole0D64BCB5` - AWS::IAM::Role
- `DoctorBackenddevServiceRoleDefaultPolicy18D6E51D` - AWS::IAM::Policy
- `DoctorBackenddevD9F831D7` - AWS::Lambda::Function

### Outputs
- `DoctorBackenddevFnArn` - CloudFormation Output

---

## 8. PatientStatelessStack-dev

### Lambda
- `PatientStatelessBackenddevServiceRole1E32D3B7` - AWS::IAM::Role
- `PatientStatelessBackenddevFF7B34DD` - AWS::Lambda::Function

### Outputs
- `PatientStatelessBackenddevFnArn` - CloudFormation Output

---

## 9. UploadPatientStack-dev

### S3
- `PatientDocumentsBucketdev05E102FA` - AWS::S3::Bucket
- `PatientDocumentsBucketdevPolicy1974B4C8` - AWS::S3::BucketPolicy
- `PatientDocumentsBucketdevAutoDeleteObjectsCustomResource930D43E4` - Custom::S3AutoDeleteObjects

### Lambda
- `UploadPatientBackenddevServiceRoleD205112C` - AWS::IAM::Role
- `UploadPatientBackenddevServiceRoleDefaultPolicy3A6736A7` - AWS::IAM::Policy
- `UploadPatientBackenddev19F91618` - AWS::Lambda::Function

### Custom Resources
- `CustomS3AutoDeleteObjectsCustomResourceProviderRole3B1BD092` - AWS::IAM::Role
- `CustomS3AutoDeleteObjectsCustomResourceProviderHandler9D90184F` - AWS::Lambda::Function

### Outputs
- `PatientDocumentsBucketNamedev` - CloudFormation Output
- `UploadPatientBackenddevFnArn` - CloudFormation Output

---

## 10. PVerifyProxyStack-dev

### DynamoDB
- `PVerifyTokensdev8C2062C8` - AWS::DynamoDB::Table

### Lambda (VPC)
- `PVerifyProxyRoledev7820F33B` - AWS::IAM::Role
- `PVerifyProxyRoledevDefaultPolicy41A8E523` - AWS::IAM::Policy
- `PVerifyProxydev2BEE706F` - AWS::Lambda::Function (in VPC)

### Outputs
- `PVerifyTokenTableNamedev` - CloudFormation Output
- `PVerifyProxyFnArndev` - CloudFormation Output

---

## 11. IguanaXStack-dev

### Secrets Manager
- `IguanaXSecretsdevE802A8EE` - AWS::SecretsManager::Secret

### EC2
- `IguanaXSgdevD944102C` - AWS::EC2::SecurityGroup
- `IguanaXRoledevA5C6D988` - AWS::IAM::Role
- `IguanaXRoledevDefaultPolicy8647462B` - AWS::IAM::Policy
- `IguanaXInstancedevInstanceProfile5756AF15` - AWS::IAM::InstanceProfile
- `IguanaXInstancedev65CB67AC8bde2640f86f27ec` - AWS::EC2::Instance

### Outputs
- `IguanaXSecretsArndev` - CloudFormation Output
- `IguanaXInstanceIddev` - CloudFormation Output
- `IguanaXPrivateIpdev` - CloudFormation Output

---

## 12. EdenAgentBffStack-dev

### Security Group
- `AgentBffSgdev5C87B629` - AWS::EC2::SecurityGroup

### Secrets Manager
- `AgentBffConfigdevE93AC956` - AWS::SecretsManager::Secret

### Lambda (VPC)
- `EdenAgentBffBackenddevServiceRoleAC9C89CC` - AWS::IAM::Role
- `EdenAgentBffBackenddevServiceRoleDefaultPolicy1C3BFEF8` - AWS::IAM::Policy
- `EdenAgentBffBackenddev12F9231D` - AWS::Lambda::Function (in VPC)

### Outputs
- `AgentBffSecretArndev` - CloudFormation Output
- `EdenAgentBffBackenddevFnArn` - CloudFormation Output

---

## 13. APIStack-dev

### API Gateway
- `ApiGatewayAccessLogsdev0146B2A3` - AWS::Logs::LogGroup
- `PublicGatewaydevB7BF30C2` - AWS::ApiGateway::RestApi
- `PublicGatewaydevDeployment6457221Bc197fc4b873041695ec32b9a4f08b1ae` - AWS::ApiGateway::Deployment
- `PublicGatewaydevDeploymentStagedev1E682229` - AWS::ApiGateway::Stage

### API Resources
- `/patient` - Resource + ANY method + {proxy+}
- `/doctor` - Resource + ANY method + {proxy+}
- `/nostate` - Resource + ANY method + {proxy+}
- `/resource-patient` - Resource + ANY method + {proxy+}
- `/pverify` - Resource + ANY method + {proxy+}
- `/eden-agent-bff` - Resource + ANY method + {proxy+}

### Custom Domain
- `CustomDomain21DD44B6` - AWS::ApiGateway::DomainName
- `BasePathMappingF35F2767` - AWS::ApiGateway::BasePathMapping
- `ApiCustomDomainRecordBF67E1EE` - AWS::Route53::RecordSet

---

## 14. EnhancedAPIStack-dev

### API Gateway
- `EnhancedApiAccessLogsdev1E1CE833` - AWS::Logs::LogGroup
- `EnhancedAPIdev772D7643` - AWS::ApiGateway::RestApi
- `EnhancedAPIdevCloudWatchRoleDE50A883` - AWS::IAM::Role
- `EnhancedAPIdevAccount5C08A6F2` - AWS::ApiGateway::Account
- `EnhancedAPIdevDeploymentE35F2AB374484116c2adaede90f4838f6849eeea` - AWS::ApiGateway::Deployment
- `EnhancedAPIdevDeploymentStagedevD31E3F0B` - AWS::ApiGateway::Stage

### Authorizers
- `ApiKeyAuthorizerFunctiondevServiceRoleB403AEB5` - AWS::IAM::Role
- `ApiKeyAuthorizerFunctiondevServiceRoleDefaultPolicy81846304` - AWS::IAM::Policy
- `ApiKeyAuthorizerFunctiondevFDF27512` - AWS::Lambda::Function
- `CognitoAuthorizerdevA4201B07` - AWS::ApiGateway::Authorizer
- `ApiKeyAuthorizerdev8339975F` - AWS::ApiGateway::Authorizer

### Usage Plans
- `UsagePlanmobiledev12A8DC09` - AWS::ApiGateway::UsagePlan
- `UsagePlanexternaldevA17763C8` - AWS::ApiGateway::UsagePlan
- `UsagePlanpartnerdev78C84B47` - AWS::ApiGateway::UsagePlan

### API Resources
- `/health` - GET, OPTIONS
- `/admin` - GET, OPTIONS
- `/protected` - GET, OPTIONS
- `/patient/dashboard` - ANY, OPTIONS
- `/patient/forms` - ANY, OPTIONS
- `/patient/check-in` - ANY, OPTIONS
- `/patient/actions` - ANY, OPTIONS
- `/patient/stateless` - ANY, OPTIONS
- `/eden-agent-bff/health` - GET, OPTIONS
- `/eden-agent-bff/insurance/verify` - ANY, OPTIONS
- `/eden-agent-bff/doctors` - ANY, OPTIONS
- `/eden-agent-bff/patients` - ANY, OPTIONS
- `/eden-agent-bff/appointments` - ANY, OPTIONS
- `/eden-agent-bff/alerts` - ANY, OPTIONS
- `/eden-agent-bff/admin` - GET, OPTIONS

### Custom Domain
- `Domaindev156EA04E` - AWS::ApiGateway::DomainName
- `BasePathMappingdevDC519F5B` - AWS::ApiGateway::BasePathMapping

### Outputs
- `ApiGatewayUrldev` - CloudFormation Output
- `CustomDomainUrldev` - CloudFormation Output

---

## 15. KeyMgmtAPIStack-dev

### API Gateway
- `KeyMgmtAPIdev766BE58D` - AWS::ApiGateway::RestApi
- `KeyMgmtAPIdevCloudWatchRole1AA11B81` - AWS::IAM::Role
- `KeyMgmtAPIdevAccount54ECF9E1` - AWS::ApiGateway::Account
- `KeyMgmtAPIdevDeployment606D278336f42d160693ff6e22076cc0d57690fb` - AWS::ApiGateway::Deployment
- `KeyMgmtAPIdevDeploymentStagedev2D604013` - AWS::ApiGateway::Stage

### Authorizer
- `KeyMgmtCognitoAuthorizerdev6939CD93` - AWS::ApiGateway::Authorizer

### API Resources
- `/keys/create` - POST, OPTIONS
- `/keys/revoke` - POST, OPTIONS
- `/keys/list` - GET, OPTIONS

### Custom Domain
- `KeyMgmtDomaindev751913D0` - AWS::ApiGateway::DomainName
- `KeyMgmtBasePathMappingdev7D286F76` - AWS::ApiGateway::BasePathMapping

### Outputs
- `KeyMgmtApiGatewayUrldev` - CloudFormation Output
- `KeyMgmtCustomDomainUrldev` - CloudFormation Output

---

## 16. MonitoringStack-dev

### SNS Topics
- `CriticalAlertsdev68A8CC08` - AWS::SNS::Topic
- `CriticalAlertsdevalertsedenhealthcom5C08E01D` - AWS::SNS::Subscription
- `WarningAlertsdev3BF3F120` - AWS::SNS::Topic
- `WarningAlertsdevalertsedenhealthcomD5E615AF` - AWS::SNS::Subscription

### CloudWatch Alarms
- `ApiErrorsdevAD7FFCCA` - AWS::CloudWatch::Alarm
- `AuthErrorsdevF3438E07` - AWS::CloudWatch::Alarm
- `AuthFailuresdevEA5F99B8` - AWS::CloudWatch::Alarm

### CloudWatch Dashboard
- `AuthDashboarddevC674488F` - AWS::CloudWatch::Dashboard

### Outputs
- `CriticalAlertsTopicArndev` - CloudFormation Output
- `DashboardUrldev` - CloudFormation Output

---

## 17. InstanceConnectEndpointStack-dev

### EC2 Instance Connect
- `EICEndpointSgdev3590E51A` - AWS::EC2::SecurityGroup
- `EICEndpointdev` - AWS::EC2::InstanceConnectEndpoint (via CloudFormation custom resource)

### Outputs
- `EICEndpointIddev` - CloudFormation Output

---

## Summary Statistics

**Total CloudFormation Resources:** ~250+

### By Service
- Lambda Functions: 9
- DynamoDB Tables: 14
- API Gateway APIs: 3
- Cognito User Pools: 2
- S3 Buckets: 1
- EC2 Instances: 1
- VPCs: 1
- Subnets: 4
- Security Groups: 9
- VPC Endpoints: 6
- Secrets Manager Secrets: 3
- SNS Topics: 2
- CloudWatch Alarms: 3
- CloudWatch Dashboards: 1
- CloudWatch Log Groups: 5
- IAM Roles: ~15
- IAM Policies: ~20

---

**End of Stack Breakdown**
