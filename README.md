# Quick Start Java & MongoDB Project

## 지원 버전

- Java 8 to 13
- Spring boot 2.2.0.RELEASE
- MongoDB 4.2.1
- MongoDB Java driver 3.11.1
- Maven 3.6.2

## MongoDB Atlas

 - Get started with a Free Tier Cluster on [MongoDB Atlas](http://bit.ly/mongodb-meetatlas).
 - Read this blog post: [Quick Start - Getting your Free MongoDB Atlas Cluster](https://www.mongodb.com/blog/post/quick-start-getting-your-free-mongodb-atlas-cluster).
- You will need to update the default MongoDB URI `spring.data.mongodb.uri` in the `application.properties` file.

## 사용방법

- 서버 통합 실행(DB를 포함)을 위한 명령어 `./server.sh start`
- 서버 프로젝트 테스트를 위한 명령어 `./server.sh test`
- 서버 프로젝트 전체 캐시 삭제를 위한 명령어 `./server.sh clean all` 또는 DB 데이터 삭제를 위한 명령어 `./server.sh clean db` 또는 빌드된 데이터 삭제를 위한 명령어 `./server.sh clean target`
- 서버 프로젝트 빌드를 위한 명령어 `./server.sh build` 또는 빌드 후 자동 실행을 위한 명령어 `./server.sh build run`
- 빌드된 서버 프로젝트(.jar 파일)의 실행을 위한 명령어 `./server.sh run`

## REST API 문서(Swagger) 프레임워크
- Swagger는 본 프로젝트의 `SwaggerConfig.java`에 구성되어 정의됨
- 프로젝트 실행 후 제공되는 API는 다음의 링크에서 확인 할 수 있음 [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html).
- Swagger를 통하여 제공되는 REST API의 실행 및 테스트 진행이 가능함

## Features showcase
본 프로젝트의 특징으로 MongoDB의 추가적인 기능을 지원함:

- MongoDB의 multi-document ACID 트랜잭션을 위한 기능을 제공. `MongoDBPersonRepository.saveAll()` 파일을 통하여 확인 가능함.
- 기본적인 CRUD 쿼리를 구현함. `MongoDBPersonRepository.java` 파일을 통하여 확인 가능함.

And some other cool stuff:
- You can change the default Spring Boot logo by adding a banner.txt file in your properties.
- You don't have to use Spring Data MongoDB. The MongoDB driver is more flexible and already provide everything you need to code efficiently and optimise your queries correctly.

## Author
- 이성진(zofldj16002@gmail.com)
