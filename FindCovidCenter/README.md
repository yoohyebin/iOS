코로나19 예방 접종 센터 찾기
===========
<img src="https://user-images.githubusercontent.com/55949986/205566056-5d4a26ee-0ceb-4877-a2a9-beff78ed8ff9.gif" width="300" height="550"/>

* 각 지자체 별로 몇개의 예방 접종 센터가 있는지 나타냄
* 해당 지역에 대한 예방 접종 센터 정보를 리스트로 보여줌
* 센터를 클릭하면 지도에 위치를 보여주고, 전화번호 클릭시 전화 화면으로 넘어감
<br>

* SwiftUI Combine을 사용하여 개발
* "코로나19 예방접종센터 조회서비스" API 사용: https://www.data.go.kr/data/15077586/openapi.do

---------------------------------------

* Combine
    * 2019 WWDC에서 발표한 프레임워크
    * 시간 경과에 따른 값 처리를 위한 선언적(declarative) API
    * 이벤트 처리 연산자를 결합해서 비동기 이벤트 처리를 커스터마이징 할 수 있음
    * 값을 내보내는 Publisher와 이를 수신하는 Subcriber를 통해서 비동기 이벤트를 처리하기 위한 프레임워크
    * 이벤트 처리 코드를 중앙 집중화(centralizing)
    * 중첩된 closures 및 콜백과 같은 까다로운 기술을 제거 하여 코드를 읽고 유지보수하기 쉽게 만듦
    
* Publisher
    * Subscriber 객체에 변경되는 값을 내보낼 타입을 선언하기 위한 프로토콜
    * Output, Failure 타입이 제네릭으로 구현
    * 하나 이상의 Subscriber인스턴스에게 element를 제공
    * receive(subscriber:)메소드를 구현해 subscriber를 accept
        * Just: 가장 단순한 형태의 Publsiher로 에러타입으로 Never를 가짐
        * Promise: Just와 비슷하지만 Filter Type을 정의할 수 있음
        * Fail: 정의된 실패타입을 내보냄
        * Empty: 어떤 데이터도 발행하지 않는 퍼블리셔로 주로 에러처리나 옵셔널값을 처리할때 사용
        * Sequence: 데이터를 순차적으로 발행하는 Publisher
        * ObservableObjectPublisher: SwiftUI에서 사용되는 ObservableObject를 준수하는 Publisher
        
* Subscriber
    * Publisher에게 값을 받을 수 있는 타입을 선언하기 위한 프로토콜
    * Input, Failure 타입이 제네릭으로 구현
    * Subscriber 인스턴스는 Publisher의 element stream과 그들의 relationship의 변경사항을 설명하는 life cycle 이벤트를 받음
        * Subscriber를 상속받아 직접 구현하기 
        * sink를 이용하여 결괏값 받기 
        * asggin을 이용하여 스트림 값을 전달
        
* Opeator
    * Publisher가 내보내는 값을 처리하는 메소드
    * Publisher 프로토콜에 선언
    * Input, Output을 가지고 있음
    
* Subject
    * publisher의 일종
    * 밖에서 값을 방출 가능
    * send(_:)를 통해 stream에 값을 주입할 수 있는 publisher
    
* Cancellable
    * Subscriber는 Cancellable을 리턴 값으로 가짐
    * 데이터 발행 중 cancel() 메서드가 호출되었을 때 모든 파이프라인이 멈추고 끝남
    * 만약 사용자가 데이터 로딩을 기다리던도중 뒤로 간다거나 취소를 누른는경우처럼 스트림을 중단해야할때 사용 가능

