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

