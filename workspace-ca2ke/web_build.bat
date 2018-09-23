@echo off



set tomcat_service_name=tomcat_8

set gen_war=ca2ke-0.0.1-SNAPSHOT.war
set target_forRd="\Program Files\Apache Software Foundation\Tomcat 8.0_Tomcat_8\webapps\ca2ke-0.0.1-SNAPSHOT"
set target_forDel="\Program Files\Apache Software Foundation\Tomcat 8.0_Tomcat_8\webapps\ca2ke-0.0.1-SNAPSHOT.war"
set target_forCopy="\Program Files\Apache Software Foundation\Tomcat 8.0_Tomcat_8\webapps"


::::::::::::::::::::::::::::::::::::::::::


net stop %tomcat_service_name%

rd /s /q %target_forRd%
del %target_forDel%

start /wait cmd /c mvn clean package

cd target

copy %gen_war% %target_forCopy%

net start %tomcat_service_name%

cd ../