#test
FROM docker.io/chetanpatil17/liberpoc:new-without-root 
USER tester
SHELL ["/bin/bash", "-c"]
CMD ["/home/tester/bin/ltpconfigure.sh"]
