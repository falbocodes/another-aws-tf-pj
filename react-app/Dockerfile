FROM node:11.13 as build
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY ./ /app/
RUN npm run build

FROM nginx:1.23
COPY --from=build /app/build/ /usr/share/nginx/html

RUN touch /var/run/nginx.pid && \
  chown -R www-data:www-data /var/run/nginx.pid && \
  chown -R www-data:www-data /var/cache/nginx && \
  sed -i s/80/8080/ /etc/nginx/conf.d/default.conf

EXPOSE 8080

USER 33