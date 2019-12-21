# Prod-version
# take Image "10-alpine" of node.js - because alpine doesn't exist

FROM node:10-alpine as builder

WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html