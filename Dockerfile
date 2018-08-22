FROM docker.io/chetanpatil17/liberpoc:new-without-root 
EXPOSE 5432
ADD start.sh /tmp/start.sh
CMD ["/tmp/start.sh"]
