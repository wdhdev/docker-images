# nginx Redirector
Easily redirect a domain to another using nginx.

## Environment Variables
- `SERVER_NAME` (*required*) - The domain to redirect.
- `REDIRECT_URL` (*required*) - Where to redirect the domain.
- `REDIRECT_STATUS` (*optional*, defaults to `301`) - The status code to use when redirecting the domain.

## Running

```sh
docker run -d -p 80:80 \
-e SERVER_NAME=old-domain.com \
-e REDIRECT_URL=http://new-domain.com \
william/nginx-redirector
```

### Using a custom status code
```sh
docker run -d -p 80:80 \
-e SERVER_NAME=old-domain.com \
-e REDIRECT_URL=http://new-domain.com \
-e REDIRECT_STATUS=302 \
william/nginx-redirector
```
