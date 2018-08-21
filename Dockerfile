#test
FROM docker.io/chetanpatil17/liberpoc:new-without-root 
USER tester
SHELL ["/bin/bash", "-c"]
RUN source /home/tester/.bash_profile
CMD ["/home/tester/bin/ltpconfigure.sh"]
