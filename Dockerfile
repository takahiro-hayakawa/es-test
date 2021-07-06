FROM docker.elastic.co/elasticsearch/elasticsearch:7.13.2
RUN elasticsearch-plugin install analysis-kuromoji