FROM nginx:alpine

RUN apk add --no-cache curl

WORKDIR /usr/share/nginx/html

# Remove default files
RUN rm ./*

# Pull the NGINX configuration
RUN curl -o /etc/nginx/nginx.conf https://raw.githubusercontent.com/wdhdev/docker-images/refs/heads/main/psl-nginx/nginx.conf

# Deploy https://github.com/wdhdev/psl-json
RUN curl -o public_suffix_list.json https://raw.githubusercontent.com/wdhdev/psl-json/refs/heads/main/list/public_suffix_list.json

# Deploy https://github.com/wdhdev/psl-min
RUN curl -o public_suffix_list.min.dat https://raw.githubusercontent.com/wdhdev/psl-min/refs/heads/main/list/public_suffix_list.min.dat

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
