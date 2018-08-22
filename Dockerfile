FROM docker.io/chetanpatil17/liberpoc:new-without-root 
EXPOSE 5432
COPY setup.sh /usr/local/bin
CMD ["/usr/local/bin/setup.sh"]
