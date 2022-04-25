## ArgoCD Deployment

Create namespace

```bash
kubectl create namespace argocd
```

Add helm repo

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
```


Install argocd

```bash
helm secrets upgrade --install argocd argo/argo-cd --version 4.2.1 --namespace argocd  --values values.yaml --values secrets.enc.yaml
```

Verify deployment

```bash
helm ls -n argocd
kubectl get all --namespace argocd
```



## Access ArgoCD UI

In order to access the server UI you can use ingress host or port forwarding:

Kubectl port forwarding

```bash
kubectl port-forward service/argocd-server -n argocd 8080:443
```

Extract admin password from ArgoCD secrect. After reaching the UI the first time you can login with username: admin and the random password generated during the installation. You can find the password by running:

```bash
export ARGOCD_ADMIN_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
echo $ARGOCD_ADMIN_PASSWORD
```