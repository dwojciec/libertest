FROM docker.io/chetanpatil17/liberpoc:new-without-root 
ADD ltp.properties /home/tester/etc/ltp.properties
USER tester
ADD start.sh /tmp/start.sh
CMD ["/tmp/start.sh"]
