EKS cluster uses IAM user/role to access the cluster. Therefore, let's map the `deployer` IAM role with the EKS cluster role so that the `deployer` role gets cluster admin access.

```bash
$EKS_CLUSTER_NAME=development
$AWS_ACCOUNT_ID=222222222222
```

```bash
eksctl create iamidentitymapping --cluster ${EKS_CLUSTER_NAME} --arn arn:aws:iam::${AWS_ACCOUNT_ID}:role/Deployer --group system:masters --username deployer
```
