FROM registry.access.redhat.com/ubi8/nginx-118

# Add application sources
ADD app/nginx.conf "${NGINX_CONF_PATH}"
ADD app/nginx-default-cfg/*.conf "${NGINX_DEFAULT_CONF_PATH}"
ADD app/nginx-cfg/*.conf "${NGINX_CONFIGURATION_PATH}"
ADD app/*.html ./
ADD entrypoint.sh /

USER 0
RUN chown -R 1001:0 ${NGINX_CONF_PATH}

USER 1001
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

ENTRYPOINT ["/entrypoint.sh"]

# Run script uses standard ways to run the application
CMD nginx -g "daemon off;"
