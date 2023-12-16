# Use Node.js 18 image to build the Angular app
FROM node:18 AS build

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

# Use Nginx image to serve the Angular app
FROM nginx:latest

# Copy NGINX configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
