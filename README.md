# cicd
CI/CD pipeline with drone + gogs


# CI/CD Environment for local development

This is a builder for a fast, lightweight & efficient pipeline workflows owning your own private "github" with gogs and automated pipelines with awesome already built in plugins with drone.

The main objective is to have a fast deployable infrastructure to be able to: 

* Host code in different repositories/organizations
* Be able to trigger builds and design pipelines to buyild, test and deploy stuff ... 
* Do it as fast as possible


Since the tools are written in go they are quite fast.

The Stack is composed by: 

* PostgreSQL: to store some data for gogs
* gogs: code repository 
* drone: pipelines and jobs & tasks manager/scheduler
* drone-runner: spin up containers to do the tasks/jobs


## Quickstart: 

1. Clone the repository `git clone git@github.com:zpol/cicd.git`
2. Enter the directory and execute the start.sh file to spin up all the components with docker-compose. (You will need docker-compose installed in your system)

`cd cicd`  
`./start.sh`

Then you can access: 

Gogs: http://localhost:3000 

<screenshot config gogs>
<screenshot gogs user + repo created>

Drone: http://localhost:8080

Access with same gogs credentials (drone does not support OpenID).

# Using podman

Using rootless podman socket:

```shell
systemctl --user enable --now podman.socket
```

Now you can map the podman socket in rootless mode:

**$XDG_RUNTIME_DIR/podman/podman.sock:/var/run/docker.sock**

Use [podman-compose.yml](./podman-compose.yml) instead of the [docker-compose.yml](./docker-compose.yml).

Just run:

```shell
./start.sh podman
```

> If you want to stop podman, run **$ podman-compose -f podman-compose.yml down**


# Branches

`main` will act as a main branch where everything is merged into when tested.
`drone` This branch will probably continue a little bit since it's already working except for trigerring auto on code push