# Infrastructure Teardown Plan

**AWS Account:** 523494594546  
**Region:** us-east-1  
**Environment:** dev  
**Total Stacks:** 18

---

## ⚠️ CRITICAL WARNINGS

### Before You Begin

1. **DATA LOSS WARNING**: This operation will permanently delete:
   - 14 DynamoDB tables with all patient, doctor, and form data
   - 1 S3 bucket with patient documents
   - All CloudWatch logs
   - All secrets in Secrets Manager

2. **BACKUP CHECKLIST**:
   - [ ] Export all DynamoDB tables to S3
   - [ ] Download all files from PatientDocumentsBucket-dev
   - [ ] Export CloudWatch logs if needed for compliance
   - [ ] Save Secrets Manager secrets
   - [ ] Document any custom configurations

3. **VERIFICATION**:
   - [ ] Confirm this is the correct AWS account (523494594546)
   - [ ] Confirm this is the correct environment (dev)
   - [ ] Confirm no production traffic is using these resources
   - [ ] Get approval from stakeholders

---

## Teardown Execution Order

Stacks must be deleted in reverse dependency order to avoid errors.

### Phase 1: Monitoring & APIs (4 stacks)

#### Step 1.1: Delete MonitoringStack-dev
```bash
cd /home/marcus-roldan/eden/dev/backend/cdk
export AWS_REGION=us-east-1
export STAGE=dev

cdk destroy MonitoringStack-dev --force
```

**Resources to be deleted:**
- 2 SNS Topics
- 2 SNS Subscriptions
- 3 CloudWatch Alarms
- 1 CloudWatch Dashboard

**Estimated time:** 2-3 minutes

---

#### Step 1.2: Delete KeyMgmtAPIStack-dev
```bash
cdk destroy KeyMgmtAPIStack-dev --force
```

**Resources to be deleted:**
- 1 API Gateway
- 1 Cognito Authorizer
- 3 API Resources
- 1 Custom Domain mapping

**Estimated time:** 2-3 minutes

---

#### Step 1.3: Delete EnhancedAPIStack-dev
```bash
cdk destroy EnhancedAPIStack-dev --force
```

**Resources to be deleted:**
- 1 API Gateway
- 1 Lambda Authorizer Function
- 2 Authorizers
- 3 Usage Plans
- 15+ API Resources
- 1 Custom Domain mapping
- 1 CloudWatch Log Group

**Estimated time:** 3-5 minutes

---

#### Step 1.4: Delete APIStack-dev
```bash
cdk destroy APIStack-dev --force
```

**Resources to be deleted:**
- 1 API Gateway (Legacy)
- 6 API Resources with proxy integrations
- 1 Custom Domain
- 1 Route53 Record
- 1 CloudWatch Log Group

**Estimated time:** 3-5 minutes

---

### Phase 2: Application Layer (7 stacks)

#### Step 2.1: Delete EdenAgentBffStack-dev
```bash
cdk destroy EdenAgentBffStack-dev --force
```

**Resources to be deleted:**
- 1 Lambda Function (in VPC)
- 1 Security Group
- 1 Secrets Manager Secret
- IAM Role and Policies

**Estimated time:** 2-3 minutes

---

#### Step 2.2: Delete IguanaXStack-dev
```bash
cdk destroy IguanaXStack-dev --force
```

**Resources to be deleted:**
- 1 EC2 Instance
- 1 Security Group
- 1 IAM Role and Instance Profile
- 1 Secrets Manager Secret

**Estimated time:** 3-5 minutes

---

#### Step 2.3: Delete PVerifyProxyStack-dev
```bash
cdk destroy PVerifyProxyStack-dev --force
```

**Resources to be deleted:**
- 1 Lambda Function (in VPC)
- 1 DynamoDB Table (PVerifyTokens-dev)
- IAM Role and Policies

**Estimated time:** 2-3 minutes

---

#### Step 2.4: Delete UploadPatientStack-dev
```bash
cdk destroy UploadPatientStack-dev --force
```

**Resources to be deleted:**
- 1 S3 Bucket (with auto-delete)
- 1 Lambda Function
- IAM Role and Policies

**Estimated time:** 2-3 minutes

---

#### Step 2.5: Delete PatientStatelessStack-dev
```bash
cdk destroy PatientStatelessStack-dev --force
```

**Resources to be deleted:**
- 1 Lambda Function
- IAM Role

**Estimated time:** 1-2 minutes

---

#### Step 2.6: Delete DoctorStack-dev
```bash
cdk destroy DoctorStack-dev --force
```

**Resources to be deleted:**
- 1 Lambda Function
- 1 CloudWatch Log Group
- IAM Role and Policies

**Estimated time:** 2-3 minutes

---

#### Step 2.7: Delete PatientStack-dev
```bash
cdk destroy PatientStack-dev --force
```

**Resources to be deleted:**
- 1 Lambda Function
- 1 CloudWatch Log Group
- IAM Role and Policies

**Estimated time:** 2-3 minutes

---

### Phase 3: Supporting Services (4 stacks)

#### Step 3.1: Delete InstanceConnectEndpointStack-dev
```bash
cdk destroy InstanceConnectEndpointStack-dev --force
```

**Resources to be deleted:**
- 1 EC2 Instance Connect Endpoint
- 1 Security Group

**Estimated time:** 2-3 minutes

---

#### Step 3.2: Delete ApiKeyMgmtStack-dev
```bash
cdk destroy ApiKeyMgmtStack-dev --force
```

**Resources to be deleted:**
- 1 DynamoDB Table (ApiKeys-dev)
- 1 Lambda Function
- 1 Secrets Manager Secret
- IAM Role and Policies

**Estimated time:** 2-3 minutes

---

#### Step 3.3: Delete AuthStack-dev
```bash
cdk destroy AuthStack-dev --force
```

**Resources to be deleted:**
- 2 Cognito User Pools
- 2 Cognito User Pool Clients
- 1 Lambda Function (Custom Auth)
- IAM Roles

**Estimated time:** 3-5 minutes

---

#### Step 3.4: Delete DDBStack-dev
```bash
cdk destroy DDBStack-dev --force
```

**⚠️ CRITICAL: This deletes 12 DynamoDB tables with all data!**

**Resources to be deleted:**
- PatientBaseMaster-dev
- DoctorBaseMaster-dev
- CheckInBaseMaster-dev
- DoctorFormRel-dev
- FormsBaseMaster-dev
- FormsTemplateBaseMaster-dev
- LocationBaseMaster-dev
- OTPBaseMaster-dev
- PatientFormRel-dev
- QRBaseMaster-dev
- RedisSession-dev
- TempSessionData-dev

**Estimated time:** 5-10 minutes

---

### Phase 4: Foundation (2 stacks)

#### Step 4.1: Delete PatientMobileStack-dev
```bash
cdk destroy PatientMobileStack-dev --force
```

**Resources to be deleted:**
- 1 VPC
- 4 Subnets
- 1 NAT Gateway
- 1 Internet Gateway
- 6 VPC Endpoints
- 5 Security Groups
- 4 Route Tables
- 1 Elastic IP
- VPC Flow Logs

**Estimated time:** 5-10 minutes

---

#### Step 4.2: Delete DomainStack-dev
```bash
cdk destroy DomainStack-dev --force
```

**Resources to be deleted:**
- 1 ACM Certificate

**Estimated time:** 1-2 minutes

---

## Complete Teardown Script

### Option 1: Interactive (Recommended)
```bash
#!/bin/bash
# teardown-interactive.sh

set -e

export AWS_REGION=us-east-1
export STAGE=dev
cd /home/marcus-roldan/eden/dev/backend/cdk

echo "⚠️  WARNING: This will delete ALL infrastructure in dev environment"
echo "AWS Account: 523494594546"
echo "Region: us-east-1"
echo ""
read -p "Have you backed up all data? (yes/no): " backup_confirm
if [ "$backup_confirm" != "yes" ]; then
    echo "Aborting. Please backup data first."
    exit 1
fi

read -p "Type 'DELETE-ALL-DEV' to confirm: " confirm
if [ "$confirm" != "DELETE-ALL-DEV" ]; then
    echo "Confirmation failed. Aborting."
    exit 1
fi

echo ""
echo "Starting teardown..."
echo ""

# Phase 1: Monitoring & APIs
echo "Phase 1: Deleting Monitoring & APIs..."
cdk destroy MonitoringStack-dev --force
cdk destroy KeyMgmtAPIStack-dev --force
cdk destroy EnhancedAPIStack-dev --force
cdk destroy APIStack-dev --force

# Phase 2: Application Layer
echo "Phase 2: Deleting Application Layer..."
cdk destroy EdenAgentBffStack-dev --force
cdk destroy IguanaXStack-dev --force
cdk destroy PVerifyProxyStack-dev --force
cdk destroy UploadPatientStack-dev --force
cdk destroy PatientStatelessStack-dev --force
cdk destroy DoctorStack-dev --force
cdk destroy PatientStack-dev --force

# Phase 3: Supporting Services
echo "Phase 3: Deleting Supporting Services..."
cdk destroy InstanceConnectEndpointStack-dev --force
cdk destroy ApiKeyMgmtStack-dev --force
cdk destroy AuthStack-dev --force
cdk destroy DDBStack-dev --force

# Phase 4: Foundation
echo "Phase 4: Deleting Foundation..."
cdk destroy PatientMobileStack-dev --force
cdk destroy DomainStack-dev --force

echo ""
echo "✅ Teardown complete!"
echo ""
```

### Option 2: Automated (Use with caution)
```bash
#!/bin/bash
# teardown-automated.sh

set -e

export AWS_REGION=us-east-1
export STAGE=dev
cd /home/marcus-roldan/eden/dev/backend/cdk

# Delete all stacks in order
STACKS=(
    "MonitoringStack-dev"
    "KeyMgmtAPIStack-dev"
    "EnhancedAPIStack-dev"
    "APIStack-dev"
    "EdenAgentBffStack-dev"
    "IguanaXStack-dev"
    "PVerifyProxyStack-dev"
    "UploadPatientStack-dev"
    "PatientStatelessStack-dev"
    "DoctorStack-dev"
    "PatientStack-dev"
    "InstanceConnectEndpointStack-dev"
    "ApiKeyMgmtStack-dev"
    "AuthStack-dev"
    "DDBStack-dev"
    "PatientMobileStack-dev"
    "DomainStack-dev"
)

for stack in "${STACKS[@]}"; do
    echo "Deleting $stack..."
    cdk destroy $stack --force || echo "Failed to delete $stack, continuing..."
    sleep 5
done

echo "Teardown complete!"
```

---

## Verification Commands

### Check remaining stacks
```bash
aws cloudformation list-stacks \
    --region us-east-1 \
    --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE \
    --query 'StackSummaries[?contains(StackName, `dev`)].StackName' \
    --output table
```

### Check remaining Lambda functions
```bash
aws lambda list-functions \
    --region us-east-1 \
    --query 'Functions[?contains(FunctionName, `dev`)].FunctionName' \
    --output table
```

### Check remaining DynamoDB tables
```bash
aws dynamodb list-tables \
    --region us-east-1 \
    --query 'TableNames[?contains(@, `dev`)]' \
    --output table
```

### Check remaining EC2 instances
```bash
aws ec2 describe-instances \
    --region us-east-1 \
    --filters "Name=tag:Environment,Values=dev" \
    --query 'Reservations[].Instances[].InstanceId' \
    --output table
```

---

## Troubleshooting

### Stack deletion fails
```bash
# Get stack events to see error
aws cloudformation describe-stack-events \
    --stack-name <STACK_NAME> \
    --region us-east-1 \
    --max-items 20

# Force delete if stuck
aws cloudformation delete-stack \
    --stack-name <STACK_NAME> \
    --region us-east-1
```

### Resources not deleted
Some resources may need manual cleanup:
- S3 buckets with versioning enabled
- CloudWatch log groups with retention
- Elastic IPs not released
- Security groups with dependencies

### Manual cleanup commands
```bash
# Delete S3 bucket
aws s3 rb s3://patient-documents-bucket-dev --force

# Delete CloudWatch log groups
aws logs delete-log-group --log-group-name /aws/lambda/Patient-Backend-dev

# Release Elastic IP
aws ec2 release-address --allocation-id <ALLOCATION_ID>
```

---

## Estimated Total Time

- **Phase 1:** 10-15 minutes
- **Phase 2:** 15-20 minutes
- **Phase 3:** 10-15 minutes
- **Phase 4:** 5-10 minutes

**Total:** 40-60 minutes

---

## Post-Teardown Verification

### 1. Verify no stacks remain
```bash
aws cloudformation list-stacks \
    --region us-east-1 \
    --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE \
    --query 'StackSummaries[?contains(StackName, `dev`)]'
```

### 2. Check for orphaned resources
```bash
# Lambda functions
aws lambda list-functions --region us-east-1 | grep dev

# DynamoDB tables
aws dynamodb list-tables --region us-east-1 | grep dev

# S3 buckets
aws s3 ls | grep dev

# EC2 instances
aws ec2 describe-instances --region us-east-1 --filters "Name=tag:Environment,Values=dev"

# VPCs
aws ec2 describe-vpcs --region us-east-1 --filters "Name=tag:Environment,Values=dev"
```

### 3. Check billing
Monitor AWS Cost Explorer for the next few days to ensure no unexpected charges.

---

## Rollback Plan

If you need to redeploy:

```bash
cd /home/marcus-roldan/eden/dev/backend/cdk
export STAGE=dev
export AWS_REGION=us-east-1

# Deploy all stacks
cdk deploy --all --require-approval never
```

**Note:** This will create new resources but will NOT restore data.

---

## Support

If you encounter issues:
1. Check CloudFormation console for detailed error messages
2. Review CloudWatch logs for Lambda failures
3. Contact AWS Support if resources are stuck in DELETE_IN_PROGRESS

---

**End of Teardown Plan**
