FROM nginx
RUN apt-get update && apt-get install -y curl && apt-get clean
RUN mkdir /app
ADD default.conf /etc/nginx/conf.d/default.conf
HEALTHCHECK --interval=5s --timeout=3s --retries=3 \
  CMD curl --silent --fail localhost:80/healthcheck || exit 1
