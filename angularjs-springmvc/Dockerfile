FROM cdwrkshp/java7-tc7
MAINTAINER Halil-Cem Guersoy <hcguersoy@gmail.com>

ADD ./ /work
RUN puppet apply -v --modulepath=/work/modules/ /work/manifests/example-1.pp
EXPOSE 8844
CMD service tomcat7 start && tail -F /var/lib/tomcat7/logs/catalina.out