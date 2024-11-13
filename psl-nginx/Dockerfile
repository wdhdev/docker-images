FROM nginx:alpine

RUN apk add --no-cache curl

WORKDIR /usr/share/nginx/html

# Remove default files
RUN rm ./*

# Pull the default configuration
RUN curl -o /etc/nginx/conf.d/default.conf https://raw.githubusercontent.com/wdhdev/docker-images/refs/heads/main/psl-nginx/default.conf

# Deploy https://github.com/wdhdev/psl-min
RUN curl -o public_suffix_list.dat https://raw.githubusercontent.com/wdhdev/psl-min/refs/heads/main/list/public_suffix_list.dat
RUN curl -o public_suffix_list.min.dat https://raw.githubusercontent.com/wdhdev/psl-min/refs/heads/main/list/public_suffix_list.min.dat

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
