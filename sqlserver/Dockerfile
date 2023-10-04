FROM mcr.microsoft.com/mssql/server:2022-latest

ENV SA_PASSWORD=!T3amC1ty
# Create a config directory
WORKDIR /usr/config

# Bundle config source
COPY sqlserver/configure-db.sh .
COPY sqlserver/entrypoint.sh .
COPY sqlserver/setup.sql .

ENTRYPOINT ["./entrypoint.sh"]