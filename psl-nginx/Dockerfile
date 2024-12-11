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

# Deploy https://github.com/groundcat/PSL-private-domains-checker
RUN mkdir private-domains-checker
RUN curl -o private-domains-checker/all.csv https://raw.githubusercontent.com/groundcat/PSL-private-domains-checker/refs/heads/main/data/all.csv
RUN curl -o private-domains-checker/expired.csv https://raw.githubusercontent.com/groundcat/PSL-private-domains-checker/refs/heads/main/data/expired.csv
RUN curl -o private-domains-checker/expiry_less_than_2yrs.csv https://raw.githubusercontent.com/groundcat/PSL-private-domains-checker/refs/heads/main/data/expiry_less_than_2yrs.csv
RUN curl -o private-domains-checker/hold.csv https://raw.githubusercontent.com/groundcat/PSL-private-domains-checker/refs/heads/main/data/hold.csv
RUN curl -o private-domains-checker/missing_psl_txt.csv https://raw.githubusercontent.com/groundcat/PSL-private-domains-checker/refs/heads/main/data/missing_psl_txt.csv
RUN curl -o private-domains-checker/nxdomain.csv https://raw.githubusercontent.com/groundcat/PSL-private-domains-checker/refs/heads/main/data/nxdomain.csv

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
