# Build Phase

FROM node:alpine

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase 

FROM nginx
EXPOSE 80 #for elasticbeanstalk to expose app on this port
#in the below line 0 indicates output of first phase
COPY --from=0 /app/build /usr/share/nginx/html