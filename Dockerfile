FROM docker.io/chetanpatil17/liberpoc:new-without-root 
USER tester
CMD ["/home/tester/bin/ltpconfigure.sh"]
