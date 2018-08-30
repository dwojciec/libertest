FROM liberpoc-test
EXPOSE 5432
COPY atos.sh /etc/profile.d
COPY setup.sh /usr/local/bin
CMD ["/usr/local/bin/setup.sh"]
