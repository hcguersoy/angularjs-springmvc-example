# AngularJS-SpringMVC-example

## Aus der Originaldokumentation: 
Ein Beispielprojekt für das Zusammenspiel von AngularJS und Spring-MVC.

Folgende Features werden gezeigt:
- Basiskonfiguration Spring MVC / AngularJS
- Einfache CRUD Funktionalität
- Generische Behandlung von (Fehler-)Meldungen
- Clientseitige I18N
- Security
- Javascript ohne globale Variablen

Das Original findet sich unter https://github.com/nidi3/AngularJS-SpringMVC-example.git

## Vagrant

In dem Projekt befindet sich ein Vagrantfile um eine VM mit Hilfe von Vagrant zu starten und dann mit Puppet zu provisionieren so dass am Ende eine VM mit Tomcat läuft in die die Beispielapplikation deployt ist.

## Docker

Zudem findet sich ein Dockerfile um ein Docker Image zu erstellen, die ebenfalls ein Tomcat mit der Beispielapplikation ernthält. Die Provisionierung des Images erfolgt dabei mit Hilfe des gleichen Puppet-Manifestes.
Kleiner Hinweis: als Basis-Image ist aktuell eins angebeben was sich nicht in dem docker.io-Index findet. Ihr könnt hier ein beliebiges Image nehmen in dem Puppet installiert ist.
