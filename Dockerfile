FROM node:12.16.1

RUN apt-get update && apt-get install -y libnss3-dev libgtk-3-0 libxss1 libasound2 libcanberra-gtk-module libcanberra-gtk3-module libgl1-mesa-glx libgl1-mesa-dri mesa-utils mesa-utils-extra sudo

WORKDIR /app/

# Give the node user (added by the base image) access to the working directory.
RUN chown -R node /app

RUN usermod -a -G video node
RUN usermod -a -G sudo node
USER node

COPY --chown=node package.json /app/

RUN yarn

COPY ./ /app/

CMD ["yarn", "start"]
