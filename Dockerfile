# syntax=docker/dockerfile:1.4
FROM ubuntu:latest
RUN apt update
# copy system files in the docker project directory.
COPY --from=backupsys01_prod scripts/main.sh scripts/device_manager.sh scripts/log_manager.sh scripts/.env scripts/.gitignore /
CMD ["/main.sh"]
