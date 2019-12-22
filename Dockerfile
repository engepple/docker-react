# Prod-version (incl EXPOSE for AWS work correctly)
# take Image "10-alpine" of node.js - because alpine doesn't exist

FROM node:10-alpine as builder

WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
