FROM docker.io/chetanpatil17/liberpoc:new-without-root 
USER tester
ADD start.sh /tmp/start.sh
CMD ["/tmp/start.sh"]
