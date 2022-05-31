# GitOps - Manage multiple EKS clusters with ArgoCD

![](images/concept.png)
![](images/architecture.png)

<br/>

## AWS Command Line Interface

The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services.

##### [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

```bash
brew install awscli
```

##### [Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

```bash
aws configure
```

```text
# Example configuration
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: eu-central-1
Default output format [None]: json
```

<br/>


## Terraform

You must install AWS CLI and configure it with the credentials before you use Terraform to manage AWS resources.

##### [Install Terraform](https://www.terraform.io/downloads)

```bash
brew tap hashicorp/tap
```

```bash
brew install hashicorp/tap/terraform
```
##### [Provision infrastructure](https://www.terraform.io/cli/run)

To initialize a working directory that contains a Terraform configuration

```bash
terraform init
```

To see an execution plan that Terraform will make to your infrastructure based on the current configuration

```bash
terraform plan
```

Executes the actions that proposed in a Terraform plan

```bash
  terraform apply
```



<br/>

## SOPS

Encrypt secrets with SOPS to commit secrets to version control.

##### [Install SOPS](https://github.com/mozilla/sops#id3)

```bash
brew install sops
```

**`.sops.yaml`**

```bash
cat <<EOF > ~/.sops.yaml
creation_rules:
  - kms: "arn:aws:kms:eu-central-1:111111111111:alias/management-sops"
EOF
```



<br/>

## Helm

Helm to deploy ArgoCD on EKS cluster.

##### [Install Helm](https://helm.sh/docs/intro/install/)

```bash
brew install helm
```



<br/>

## Helm secret plugin

##### [Install Helm Secrets](https://github.com/jkroepke/helm-secrets/wiki/Installation)
```bash
helm plugin install https://github.com/jkroepke/helm-secrets
```

##### Encrypt secret

```bash
helm secrets enc secrets.yaml
```

##### Decrypt secret

```bash
helm secrets view secrets.yaml
```

##### Edit encrypt secret

```bash
helm secrets edit secrets.yaml
```



<br/>

## Provision

- [Create aws irsa on management account](management-account/irsa)
- [Deploy argocd on management eks cluster](management-account/argocd)
- [Create iam role on development account](development-account/iam-role)
- [Map IAM role with cluster role](development-account/rbac)
