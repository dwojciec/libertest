FROM docker.io/chetanpatil17/liberpoc:new-without-root 
EXPOSE 5432
COPY docker-entrypoint.sh /entrypoint.sh
COPY wait /usr/local/bin
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/bin/wait"]
