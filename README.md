# pull-request-namespace test

# First step

install argocd

```
sh./argocd/init.sh
```

# Pull request pattern

```
sh namespace-pattern/run.sh BRANCH

# for example
sh namespace-pattern/run.sh master
sh namespace-pattern/run.sh newbranch
sh namespace-pattern/run.sh d610095 (pr commit)
```

# prefix name pattern

```
sh prefix-pattern/run.sh BRANCH

# for example
sh prefix-pattern/run.sh master
sh prefix-pattern/run.sh newbranch
sh prefix-pattern/run.sh d610095 (pr commit)
```

