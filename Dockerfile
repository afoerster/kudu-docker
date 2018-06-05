FROM "centos:7"
ENV KUDU_START true 
COPY install /
RUN /install
COPY ./kudu-start /
COPY ./entrypoint /

ENTRYPOINT ["/entrypoint"]
