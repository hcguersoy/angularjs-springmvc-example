class tc7 (
    $http_port = 8844,
    $https_port = 18443,
) {

  Package { # defaults
    ensure => installed,
  }

  package { 'tomcat7':
      require => [
        Package['openjdk-7-jdk'],
        # Package['openjdk-7-jre'],
        Package['openjdk-7-jre-headless'],
        Package['openjdk-7-jre-lib'],
        #Package['authbind'],
        #Package['libtcnative-1'],
      ],
  }

  package { 'tomcat7-admin':
      require => Package['tomcat7'],
  }

  package { 'openjdk-7-jdk':
  }

  # package { 'openjdk-7-jre':
  # }

  package { 'openjdk-7-jre-headless':
  }

  package { 'openjdk-7-jre-lib':
  }

  # package { 'authbind':
  # }

  # package { 'libtcnative-1':
  # }

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
     source => '/tmp/target/angularjs-springmvc-1.1-SNAPSHOT.war'
  }  

  service { 'tomcat7':
    ensure => running,
    enable => true,
    require => Package['tomcat7'],
  }   

}