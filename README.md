# TeamCity-Space JetBrains Stack

Starts TeamCity in docker-compose with several servers of different roles (Ubuntu-based).

Requires at least 4Gb of RAM in the docker engine.

- Uses Postgres DB (`psql -p5433 -hlocalhost -Utest -dbuildserver`, password `test`)
- Starts 2 servers: one primary, one secondary.
- And, two build agents

For details on volumes, created folders, logs see [docker-compose.yml](./docker-compose.yml) file.

## To start

    make build                  // if you build your sql server image 
    make stack-teamcity-dev     // The internal database suits evaluation purposes only and is not intended for production. 
    make stack-teamcity         // with Sql Server
    make stack-teamcity-nodes   // with nodes
    make stack-teamcity-ubuntu  // on Linux Ubuntu 

Next, open [http://localhost:8111](http://localhost:8111) for the initial setup.

After creating a user, visit ["Agents -> Unauthorized"](http://localhost:8111/agents.html?tab=unauthorizedAgents) to authorize the build agent.

See [http://localhost:8111/admin/admin.html?item=nodesConfiguration](http://localhost:8111/admin/admin.html?item=nodesConfiguration) for nodes configuration.

## Space

Open your Space On-Premises instance in a browser. The default URL is [http://127.0.0.1:8084](http://127.0.0.1:8084). The default administrator username is admin, the password is admin.

Space components are accessible on the following URLs:

- [http://127.0.0.1:8084](http://127.0.0.1:8084): Space user interface.
- [http://127.0.0.1:8080](http://127.0.0.1:8080): VCS API.
- [ssh://127.0.0.1:2222](ssh://127.0.0.1:2222): VCS SSH.
- [http://127.0.0.1:8390](http://127.0.0.1:8390): Packages API.

Perform post-installation administration activities:

- [Activate your Space On-Premises instance](https://www.jetbrains.com/help/space/administration-of-space-on-premises.html#getting-a-space-product-license).
- If you want to use Space on mobile clients, [configure push notifications](https://www.jetbrains.com/help/space/administration-of-space-on-premises.html#configuring-push-notifications-for-mobile-clients).
- If you want to use Space Automation (CI/CD), [configure self-hosted Automation workers](https://www.jetbrains.com/help/space/run-steps-in-external-workers.html). Currently, Space On-Premises doesn't support cloud Automation workers.
- If you want to use your Space instance in production, [perform additional configuration](https://www.jetbrains.com/help/space/configure-space-for-docker-compose-production-environment.html): make your instance network-accessible and enable the mail server.
- If you decide to use your own object storage instead of the default one, [make sure to change its CORS policy](https://www.jetbrains.com/help/space/configure-space-for-docker-compose-production-environment.html#custom-storage-only-enable-downloads-in-space-packages) to enable downloads in the Space Packages UI.
