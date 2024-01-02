# CI/CD
CI/CD pipeline with drone + gocd


# CI/CD Environment for local development

This is a builder for a fast, lightweight & efficient pipeline workflows owning your own private "github" with gogs and automated pipelines with gocd.

The main objective is to have a fast deployable infrastructure to be able to: 

* Host code in different repositories/organizations
* Be able to trigger builds and design pipelines to buyild, test and deploy stuff ... 
* Do it as fast as possible


Since the tools are written in go they are quite fast.

The Stack is composed by: 

* PostgreSQL: to store some data for gogs
* gogs: code repository 
* gocd-server: pipelines and jobs & tasks manager/scheduler
* gocd-client: spin up containers to do the tasks/jobs


## Quickstart: 

1. Clone the repository `git clone git@github.com:zpol/cicd.git`
2. Enter the directory and execute the start.sh file to spin up all the components with docker-compose. (You will need docker-compose installed in your system)

`cd cicd`  
`./start.sh`

Then you can access: 

Gogs: http://localhost:3000 

<screenshot config gogs>
<screenshot gogs user + repo created>

GoCD: http://localhost:8153


To start coding and triggering pipelines you must setup some stuff first: 

1. Go to http://localhost:3000 and register to create an account.

2. Create a repository

3. Go to http://localhost:8153 and configure your repo , pipeline and other settings.

    Example repo config line: `http://gogs:gogs@gogs:3000/gogs/<reponame>`

4. Go to agents and enable the one that you see on the list. 

5. After the pipeline creation everything should work properly


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