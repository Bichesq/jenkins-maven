FROM openjdk:8
ADD target/my-app-1.0-SNAPSHOT.jar my-app-1.0-SNAPSHOT.jar
CMD ["java","-jar","/my-app-1.0-SNAPSHOT.jar"]
