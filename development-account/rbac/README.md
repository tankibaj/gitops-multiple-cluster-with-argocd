EKS cluster use IAM users or roles to control access to the cluster. Lets map `deployer` IAM role with EKS cluster role.

```bash
$EKS_CLUSTER_NAME=development
$AWS_ACCOUNT_ID=222222222222
```

```bash
eksctl create iamidentitymapping --cluster ${EKS_CLUSTER_NAME} --arn arn:aws:iam::${AWS_ACCOUNT_ID}:role/Deployer --group system:masters --username deployer
```
