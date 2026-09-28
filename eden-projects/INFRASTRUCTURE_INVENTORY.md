# Eden Health Backend - Infrastructure Inventory Report

**Generated:** January 2025  
**AWS Account:** 523494594546  
**Region:** us-east-1  
**Environment:** dev

---

## Executive Summary

This document catalogs all deployed AWS infrastructure for the Eden Health Backend system. The infrastructure consists of **18 CloudFormation stacks** managing compute, storage, networking, authentication, and monitoring resources.

**Total Stacks:** 18  
**Status:** All deployed and operational  
**Purpose:** Complete teardown preparation

---

## CloudFormation Stacks

### 1. DomainStack-dev
**Purpose:** SSL/TLS certificate management  
**Resources:**
- ACM Certificate (EdenCert)
- Certificate ARN export

**Dependencies:** None

---

### 2. PatientMobileStack-dev
**Purpose:** VPC and networking infrastructure  
**Resources:**
- VPC (EdenVpc) with CIDR block
- 2 Public Subnets with NAT Gateways
- 2 Private Subnets
- Internet Gateway
- Route Tables (4)
- VPC Endpoints:
  - SSM Endpoint
  - SSM Messages Endpoint
  - EC2 Messages Endpoint
  - Secrets Manager Endpoint
  - S3 Gateway Endpoint
  - DynamoDB Gateway Endpoint
- Security Groups:
  - AlbSg (ALB security group)
  - LambdaSg (Lambda security group)
- VPC Flow Logs
- CloudWatch Log Group for flow logs

**Dependencies:** None

---

### 3. DDBStack-dev
**Purpose:** DynamoDB database tables  
**Resources:** 12 DynamoDB Tables
1. PatientBaseMaster-dev
2. DoctorBaseMaster-dev
3. CheckInBaseMaster-dev
4. DoctorFormRel-dev
5. FormsBaseMaster-dev
6. FormsTemplateBaseMaster-dev
7. LocationBaseMaster-dev
8. OTPBaseMaster-dev
9. PatientFormRel-dev
10. QRBaseMaster-dev
11. RedisSession-dev
12. TempSessionData-dev

**Dependencies:** None

---

### 4. AuthStack-dev
**Purpose:** Authentication and authorization  
**Resources:**
- Cognito User Pool (UserPool-dev)
- Cognito User Pool Client (UserPoolClient-dev)
- OTP User Pool (OTPUserPool-dev)
- OTP User Pool Client (OTPUserPoolClient-dev)
- Cognito SMS Role
- Custom Auth Lambda Function
- Lambda Execution Role

**Dependencies:** None

---

### 5. ApiKeyMgmtStack-dev
**Purpose:** API key management system  
**Resources:**
- DynamoDB Table (ApiKeys-dev)
- Secrets Manager Secret (MasterKeySecret-dev)
- Lambda Function (KeyManagement-dev)
- Lambda Execution Role
- IAM Policies

**Dependencies:** None

---

### 6. PatientStack-dev
**Purpose:** Patient backend Lambda function  
**Resources:**
- Lambda Function (Patient-Backend-dev)
- Lambda Execution Role
- CloudWatch Log Group (PatientBackendLogGroup-dev)
- IAM Policies for DynamoDB, Cognito, API Keys access

**Dependencies:**
- ApiKeyMgmtStack-dev
- AuthStack-dev
- DDBStack-dev

---

### 7. DoctorStack-dev
**Purpose:** Doctor backend Lambda function  
**Resources:**
- Lambda Function (Doctor-Backend-dev)
- Lambda Execution Role
- CloudWatch Log Group (DoctorBackendLogGroup-dev)
- IAM Policies for DynamoDB access

**Dependencies:**
- DDBStack-dev

---

### 8. PatientStatelessStack-dev
**Purpose:** Stateless patient operations  
**Resources:**
- Lambda Function (Patient-Stateless-Backend-dev)
- Lambda Execution Role

**Dependencies:** None

---

### 9. UploadPatientStack-dev
**Purpose:** Patient document uploads  
**Resources:**
- S3 Bucket (PatientDocumentsBucket-dev)
- S3 Bucket Policy
- Lambda Function (Upload-Patient-Backend-dev)
- Lambda Execution Role
- Auto-delete objects custom resource

**Dependencies:**
- DDBStack-dev

---

### 10. PVerifyProxyStack-dev
**Purpose:** Insurance verification proxy  
**Resources:**
- Lambda Function (PVerifyProxy-dev) in VPC
- Lambda Execution Role
- DynamoDB Table (PVerifyTokens-dev)
- IAM Policies for VPC, Secrets Manager access

**Dependencies:**
- PatientMobileStack-dev

---

### 11. IguanaXStack-dev
**Purpose:** EHR middleware (IguanaX)  
**Resources:**
- EC2 Instance (IguanaXInstance-dev) in private subnet
- EC2 Instance Profile
- IAM Role (IguanaXRole-dev)
- Security Group (IguanaXSg-dev)
- Secrets Manager Secret (IguanaXSecrets-dev)

**Dependencies:**
- PatientMobileStack-dev

---

### 12. EdenAgentBffStack-dev
**Purpose:** Agent Backend-for-Frontend  
**Resources:**
- Lambda Function (EdenAgentBff-Backend-dev) in VPC
- Lambda Execution Role
- Security Group (AgentBffSg-dev)
- Secrets Manager Secret (AgentBffConfig-dev)
- IAM Policies

**Dependencies:**
- PatientMobileStack-dev
- PVerifyProxyStack-dev
- ApiKeyMgmtStack-dev
- AuthStack-dev

---

### 13. APIStack-dev
**Purpose:** Legacy API Gateway (v1)  
**Resources:**
- REST API Gateway (PublicGateway-dev)
- API Gateway Deployment
- API Gateway Stage (dev)
- CloudWatch Log Group (ApiGatewayAccessLogs-dev)
- API Resources and Methods:
  - /patient (ANY, {proxy+})
  - /doctor (ANY, {proxy+})
  - /nostate (ANY, {proxy+})
  - /resource-patient (ANY, {proxy+})
  - /pverify (ANY, {proxy+})
  - /eden-agent-bff (ANY, {proxy+})
- Custom Domain (api-dev.edenhealth.com)
- Base Path Mapping
- Route53 Record

**Dependencies:**
- PatientStack-dev
- DoctorStack-dev
- PatientStatelessStack-dev
- UploadPatientStack-dev
- PVerifyProxyStack-dev
- EdenAgentBffStack-dev
- DomainStack-dev

---

### 14. EnhancedAPIStack-dev
**Purpose:** Enhanced API Gateway (v2)  
**Resources:**
- REST API Gateway (EnhancedAPI-dev)
- API Gateway Deployment
- API Gateway Stage (dev)
- CloudWatch Log Group (EnhancedApiAccessLogs-dev)
- Lambda Authorizer Function (ApiKeyAuthorizerFunction-dev)
- Cognito Authorizer (CognitoAuthorizer-dev)
- API Key Authorizer (ApiKeyAuthorizer-dev)
- Usage Plans (3):
  - mobile-dev
  - external-dev
  - partner-dev
- API Resources and Methods:
  - /health (GET, OPTIONS)
  - /admin (GET, OPTIONS)
  - /protected (GET, OPTIONS)
  - /patient/* (multiple endpoints)
  - /eden-agent-bff/* (multiple endpoints)
- Custom Domain (api-dev.edenhealth.com)
- Base Path Mapping

**Dependencies:**
- PatientStack-dev
- EdenAgentBffStack-dev
- AuthStack-dev
- DomainStack-dev

---

### 15. KeyMgmtAPIStack-dev
**Purpose:** API key management API  
**Resources:**
- REST API Gateway (KeyMgmtAPI-dev)
- API Gateway Deployment
- API Gateway Stage (dev)
- Cognito Authorizer (KeyMgmtCognitoAuthorizer-dev)
- API Resources:
  - /keys/create (POST)
  - /keys/revoke (POST)
  - /keys/list (GET)
- Custom Domain (api-dev.edenhealth.com)
- Base Path Mapping

**Dependencies:**
- ApiKeyMgmtStack-dev
- AuthStack-dev
- DomainStack-dev

---

### 16. MonitoringStack-dev
**Purpose:** Monitoring and alerting  
**Resources:**
- SNS Topics (2):
  - CriticalAlerts-dev
  - WarningAlerts-dev
- SNS Subscriptions (alerts@edenhealth.com)
- CloudWatch Alarms (3):
  - ApiErrors-dev
  - AuthErrors-dev
  - AuthFailures-dev
- CloudWatch Dashboard (AuthDashboard-dev)

**Dependencies:**
- EnhancedAPIStack-dev

---

### 17. InstanceConnectEndpointStack-dev
**Purpose:** EC2 Instance Connect endpoint  
**Resources:**
- EC2 Instance Connect Endpoint
- Security Group (EICEndpointSg-dev)

**Dependencies:**
- PatientMobileStack-dev

---

### 18. Tree
**Purpose:** CDK metadata  
**Type:** cdk:tree

---

## Resource Summary by Type

### Compute
- **Lambda Functions:** 9
  - Patient-Backend-dev
  - Doctor-Backend-dev
  - Patient-Stateless-Backend-dev
  - Upload-Patient-Backend-dev
  - PVerifyProxy-dev
  - EdenAgentBff-Backend-dev
  - KeyManagement-dev
  - CustomAuthLambda-dev
  - ApiKeyAuthorizerFunction-dev

- **EC2 Instances:** 1
  - IguanaXInstance-dev (EHR middleware)

### Networking
- **VPCs:** 1
- **Subnets:** 4 (2 public, 2 private)
- **NAT Gateways:** 1
- **Internet Gateways:** 1
- **VPC Endpoints:** 6
- **Security Groups:** 5
- **Elastic IPs:** 1

### Storage
- **DynamoDB Tables:** 14
- **S3 Buckets:** 1

### API & Integration
- **API Gateways:** 3
- **API Gateway Stages:** 3
- **Custom Domains:** 1
- **Route53 Records:** 1

### Security & Auth
- **Cognito User Pools:** 2
- **Cognito User Pool Clients:** 2
- **Secrets Manager Secrets:** 3
- **ACM Certificates:** 1

### Monitoring
- **CloudWatch Log Groups:** 5
- **CloudWatch Alarms:** 3
- **CloudWatch Dashboards:** 1
- **SNS Topics:** 2

### IAM
- **IAM Roles:** ~15
- **IAM Policies:** ~20

---

## Stack Dependencies Graph

```
DomainStack-dev (Certificate)
    ↓
APIStack-dev, EnhancedAPIStack-dev, KeyMgmtAPIStack-dev

PatientMobileStack-dev (VPC)
    ↓
PVerifyProxyStack-dev, IguanaXStack-dev, EdenAgentBffStack-dev, InstanceConnectEndpointStack-dev

DDBStack-dev (Database)
    ↓
PatientStack-dev, DoctorStack-dev, UploadPatientStack-dev

AuthStack-dev (Authentication)
    ↓
PatientStack-dev, EdenAgentBffStack-dev, EnhancedAPIStack-dev, KeyMgmtAPIStack-dev

ApiKeyMgmtStack-dev (API Keys)
    ↓
PatientStack-dev, EdenAgentBffStack-dev, KeyMgmtAPIStack-dev

EnhancedAPIStack-dev
    ↓
MonitoringStack-dev
```

---

## Estimated Monthly Costs

### Compute
- Lambda (9 functions): ~$50-200/month
- EC2 (t3.medium): ~$30/month

### Networking
- NAT Gateway: ~$32/month
- VPC Endpoints: ~$15/month
- Data Transfer: ~$20-50/month

### Storage
- DynamoDB (14 tables): ~$25-100/month
- S3: ~$5-20/month

### API Gateway
- 3 API Gateways: ~$10-50/month

### Other Services
- Cognito: ~$5-20/month
- Secrets Manager: ~$3/month
- CloudWatch: ~$10-30/month

**Estimated Total:** $205-550/month (depending on usage)

---

## Teardown Order

To safely tear down all infrastructure, stacks must be deleted in reverse dependency order:

### Phase 1: Monitoring & APIs
1. MonitoringStack-dev
2. KeyMgmtAPIStack-dev
3. EnhancedAPIStack-dev
4. APIStack-dev

### Phase 2: Application Layer
5. EdenAgentBffStack-dev
6. IguanaXStack-dev
7. PVerifyProxyStack-dev
8. UploadPatientStack-dev
9. PatientStatelessStack-dev
10. DoctorStack-dev
11. PatientStack-dev

### Phase 3: Supporting Services
12. InstanceConnectEndpointStack-dev
13. ApiKeyMgmtStack-dev
14. AuthStack-dev
15. DDBStack-dev

### Phase 4: Foundation
16. PatientMobileStack-dev
17. DomainStack-dev

---

## Data Backup Considerations

Before teardown, consider backing up:

1. **DynamoDB Tables** (14 tables)
   - Export to S3 or create on-demand backups
   - Tables contain patient, doctor, forms, and session data

2. **S3 Bucket**
   - PatientDocumentsBucket-dev
   - Contains patient uploaded documents

3. **Secrets Manager**
   - Export secrets if needed for future use
   - MasterKeySecret-dev
   - IguanaXSecrets-dev
   - AgentBffConfig-dev

4. **CloudWatch Logs**
   - Export logs if needed for audit/compliance
   - 5 log groups with application logs

---

## Notes

- All resources are tagged with `Environment: dev`
- Infrastructure is managed via AWS CDK
- CDK version: 48.0.0
- Bootstrap stack version: 6
- All stacks use the same AWS account and region

---

**End of Inventory Report**
