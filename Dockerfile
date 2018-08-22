FROM docker.io/chetanpatil17/liberpoc:new-without-root 
EXPOSE 5432
COPY setup.sh /setup.sh
COPY wait /usr/local/bin
RUN /setup.sh
CMD ["/usr/local/bin/wait"]
