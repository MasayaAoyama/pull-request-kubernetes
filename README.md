# pull-request-namespace test

# First step

install argocd

```
sh ./argocd/init.sh
```

open argocd dashboard

```
kubectl -n argocd port-forward svc/argocd-server 8080:80
open http://localhost:8080
```

# Pull request pattern

* requirements
	* create Namespace resource
	* create Application resource
* limitations
	* need to aggregate settings to common ConfigMap or Secret

* spawn environment

```
sh namespace-pattern/run.sh BRANCH

# for example
sh namespace-pattern/run.sh master
sh namespace-pattern/run.sh newbranch
sh namespace-pattern/run.sh d610095 #(pr commit)
```

* delete environment

```
sh namespace-pattern/run.sh BRANCH delete

# for example
sh namespace-pattern/run.sh master delete
sh namespace-pattern/run.sh newbranch delete
sh namespace-pattern/run.sh d610095 delete #(pr commit)
```

* result

```
# for NS in master newbranch d610095; do kubectl get all -n $NS; echo "========================="; done
NAME                            READY   STATUS    RESTARTS   AGE
pod/demo-app-7b6b8cb7cb-qc2sv   1/1     Running   0          10m

NAME               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/demo-app   ClusterIP   10.103.245.29   <none>        8080/TCP   10m

NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/demo-app   1/1     1            1           10m

NAME                                  DESIRED   CURRENT   READY   AGE
replicaset.apps/demo-app-7b6b8cb7cb   1         1         1       10m
=========================
NAME                            READY   STATUS    RESTARTS   AGE
pod/demo-app-7b6b8cb7cb-xl5jl   1/1     Running   0          10m

NAME               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/demo-app   ClusterIP   10.104.34.232   <none>        8080/TCP   10m

NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/demo-app   1/1     1            1           10m

NAME                                  DESIRED   CURRENT   READY   AGE
replicaset.apps/demo-app-7b6b8cb7cb   1         1         1       10m
=========================
NAME                            READY   STATUS    RESTARTS   AGE
pod/demo-app-7c4c5bfd4c-qhttf   1/1     Running   0          10m

NAME               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/demo-app   ClusterIP   10.97.104.195   <none>        8080/TCP   10m

NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/demo-app   1/1     1            1           10m

NAME                                  DESIRED   CURRENT   READY   AGE
replicaset.apps/demo-app-7c4c5bfd4c   1         1         1       10m
=========================
```

# prefix name pattern

* requirements
	* create Application resource
* limitations
	* number of resources per Namespace
	* need to aggregate settings to common ConfigMap or Secret

* spawn environment

```
sh prefix-pattern/run.sh BRANCH

# for example
sh prefix-pattern/run.sh master
sh prefix-pattern/run.sh newbranch
sh prefix-pattern/run.sh d610095 #(pr commit)
```

* delete environment

```
sh prefix-pattern/run.sh BRANCH delete

# for example
sh prefix-pattern/run.sh master delete
sh prefix-pattern/run.sh newbranch delete
sh prefix-pattern/run.sh d610095 delete #(pr commit)
```

* result

```
# kubectl get all -n test
NAME                                      READY   STATUS    RESTARTS   AGE
pod/d610095-demo-app-7c4c5bfd4c-rm2hm     1/1     Running   0          11m
pod/master-demo-app-7b6b8cb7cb-s5dmd      1/1     Running   0          11m
pod/newbranch-demo-app-7b6b8cb7cb-b2j9v   1/1     Running   0          11m

NAME                         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
service/d610095-demo-app     ClusterIP   10.97.26.13      <none>        8080/TCP   11m
service/master-demo-app      ClusterIP   10.100.254.248   <none>        8080/TCP   11m
service/newbranch-demo-app   ClusterIP   10.97.212.226    <none>        8080/TCP   11m

NAME                                 READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/d610095-demo-app     1/1     1            1           11m
deployment.apps/master-demo-app      1/1     1            1           11m
deployment.apps/newbranch-demo-app   1/1     1            1           11m

NAME                                            DESIRED   CURRENT   READY   AGE
replicaset.apps/d610095-demo-app-7c4c5bfd4c     1         1         1       11m
replicaset.apps/master-demo-app-7b6b8cb7cb      1         1         1       11m
replicaset.apps/newbranch-demo-app-7b6b8cb7cb   1         1         1       11m
```

