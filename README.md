# TeamCity docker-compose

Starts TeamCity in docker-compose with several servers of different roles (Ubuntu-based).

Requires at least 4Gb of RAM in the docker engine.

- Uses Postgres DB (`psql -p5433 -hlocalhost -Utest -dbuildserver`, password `test`)
- Starts 2 servers: one primary, one secondary. 
- And, two build agents

For details on volumes, created folders, logs see [docker-compose.yml](./docker-compose.yml) file.

## To start

    make build
    make stack-teamcity
    make stack-teamcity-nodes
    make stack-teamcity-ubuntu

Next, open http://localhost:8111 for the initial setup.

After creating a user, visit ["Agents -> Unauthorized"](http://localhost:8111/agents.html?tab=unauthorizedAgents) to authorize the build agent.

See http://localhost:8111/admin/admin.html?item=nodesConfiguration for nodes configuration.


