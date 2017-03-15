FROM nginx:alpine

# clean default conf
RUN \
  mkdir /etc/nginx/sites && \
  mkdir /etc/nginx/html && \
  mkdir /etc/nginx/includes

# default config
COPY nginx.conf /etc/nginx
