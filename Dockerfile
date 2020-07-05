FROM alpine:latest

RUN  	\
                apk add --no-cache --virtual .build-deps \
		gcc \
  		wget \
		linux-headers \
		make \
		musl-dev \
		tar \
        \
	&& cd /opt/  \
	&& wget http://download.redis.io/releases/redis-5.0.5.tar.gz \
	&& tar -xvzf redis-5.0.5.tar.gz \
	&& rm redis-5.0.5.tar.gz \
	&& mv redis-5.0.5 redis \
	&& cd /opt/redis/ \
    	&& make	\
	&& apk del .build-deps

EXPOSE 6379

CMD [ "/opt/redis/src/redis-server", "/opt/redis/redis.conf" ]
