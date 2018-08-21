FROM docker.io/chetanpatil17/liberpoc:new-without-root 
EXPOSE 5432
USER tester
ADD start.sh /tmp/start.sh
CMD ["/tmp/start.sh"]
