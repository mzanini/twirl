FROM node:12.16.1

RUN apt-get update && apt-get install -y libnss3-dev libgtk-3-0 libxss1 libasound2

WORKDIR /app/

# Give the node user (added by the base image) access to the working directory.
RUN chown -R node /app

USER node

COPY --chown=node package.json /app/

RUN npm install

COPY ./ /app/

CMD ["npm", "start"]
