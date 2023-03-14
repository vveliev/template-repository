# [Choice] Node.js version (use -bullseye variants on local arm64/Apple Silicon): 18, 16, 14, 18-bullseye, 16-bullseye, 14-bullseye, 18-buster, 16-buster, 14-buster
ARG NODE_CONTAINER=golang:bullseye

FROM kubernetes/pause as pause
FROM ${NODE_CONTAINER}

# make the 'app' folder the current working directory
WORKDIR /app

# Install git for dev container
RUN apt update
RUN apt install -y build-essential git make bash curl python3 ruby pip nodejs npm
RUN pip install --upgrade pip
RUN pip install pre-commit
# RUN pip install --no-deps ruamel.yaml

# copy both 'package.json' and 'package-lock.json' (if available)
# COPY src/package*.json ./
# RUN yarn install
COPY --from=pause /pause /pause


# RUN su node -c "umask 0002 && npm install -g http-server @vue/cli @vue/cli-service-global"

EXPOSE 8080

RUN ssh-add -l
# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>



CMD [ "/pause" ]
