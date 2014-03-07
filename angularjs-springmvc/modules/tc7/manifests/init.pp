class tc7 (
    $http_port = 8844,
    $https_port = 18443,
    $mvntarget = '/work/target',
) {

  Package { # defaults
    ensure => installed,
  }

  package { 'tomcat7':
      require => [
        Package['openjdk-7-jdk'],
        Package['openjdk-7-jre-headless'],
        Package['openjdk-7-jre-lib'],
      ],
  }

  package { 'tomcat7-admin':
      require => Package['tomcat7'],
  }

  package { 'openjdk-7-jdk':
  }

  package { 'openjdk-7-jre-headless':
  }

  package { 'openjdk-7-jre-lib':
  }

  file { '/etc/tomcat7/server.xml':
     owner => 'root',
     require => Package['tomcat7'],
     notify => Service['tomcat7'],
     content => template('tc7/server.xml.erb'),
  }

  file { '/etc/tomcat7/tomcat-users.xml':
     owner => 'root',
     require => Package['tomcat7'],
     notify => Service['tomcat7'],
     content => template('tc7/tomcat-users.xml.erb'),
  }

  file { '/var/lib/tomcat7/webapps/angularjs-springmvc.war':
     owner => 'tomcat7',
     require => [Package['tomcat7'], File['/etc/tomcat7/server.xml'], File['/etc/tomcat7/tomcat-users.xml']],
     before => Service['tomcat7'],
     notify => Service['tomcat7'],
     source => "$mvntarget/angularjs-springmvc.war",
  }  

  #using docker, we wan't start it with the puppet run
  #as we start the service via CMD from the Dockerfile 
  #while starting a container
  service { 'tomcat7':
    ensure => false,
    enable => true,
    require => Package['tomcat7'],
  }   

}