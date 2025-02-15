# Pull Alpine Linux Image with node 18 LTS
FROM node:18.20-alpine

# Creating and setting app dir
RUN mkdir /green-farm-aid
WORKDIR /green-farm-aid

# Copy all elements to the image see .dockerignore
COPY . .

# Exposing app port
EXPOSE 5001

# Install dependencies and start the app
ENTRYPOINT [ "sh", "-c" ]
CMD [ "yarn && yarn start" ]
