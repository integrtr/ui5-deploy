# base image for docker container
FROM thevivekgowda/ui5-deploy

# copy your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# update downloaded folder permissions
RUN chmod +x /entrypoint.sh

# shell file to load once container invokes
ENTRYPOINT ["/entrypoint.sh"]
