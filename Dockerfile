FROM docker.io/chetanpatil17/liberpoc:new-without-root 
COPY start.sh /tmp/start.sh
USER tester
CMD ["/tmp/start.sh"]
