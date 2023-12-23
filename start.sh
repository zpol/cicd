#!/bin/bash

function launch_stack() {

	#export DRONE_GITHUB_CLIENT_ID=
	#export DRONE_GITHUB_CLIENT_SECRET=

	export DRONE_GITHUB_ADMIN=gogs
	export DRONE_SERVER_HOST=http://drone:3000

	export HOSTNAME=$(hostname)
	export DRONE_RPC_SECRET="$(echo ${HOSTNAME} | openssl dgst -md5 -hex)"
	export DRONE_USER_CREATE="username:${DRONE_GITHUB_ADMIN},machine:false,admin:true,token:${DRONE_RPC_SECRET}"
	docker-compose up

}

# Uncomment to cleanup local data like mysql and so on... 
# sudo rm -rf db-data drone gogs-data
launch_stack





