FROM node:8.9-alpine
MAINTAINER SirANIL
## Copy your build files build directory

COPY /build /build


# If you're using yarn:
#  yarn build

RUN npm install -g serve

# Expose PORT 5000 on our virtual machine so we can run our server
EXPOSE 5000




