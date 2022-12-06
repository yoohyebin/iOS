다음 검색 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/205566062-04802b86-fcc8-462f-9b6c-91bb96531c42.gif" width="300" height="550"/>

* 
---------------------------------------

### RXSwift 
* Operator 
  * Observable에 의해 방출되는 이벤트를 변환하고 처리하여 대응
  
* Filtering Operators : .next 이벤트를 통해 받아오는 값을 선택적으로 취함
    * .filter: 조건식에 부합하는 이벤트만 방출
    * .skip: n개의 이벤트를 skip
    * .skipWhile: 조건식을 만족할 때까지 skip하고 종료
    * .take: n개의 이벤트만 방출하고 complete
    * .takeWhile: skipWhile 과 유사
    * .distinctUntilChanged: 연달아 같은 값이 이어질 때 중복된 값을 막아줌
    * .throttle(:_scheduler): 특정시간동안 발생한 이벤트 중 가장 최신의 이벤트를 방출
  
* Transforming Operators : Observable을 변형하는 Operator
    * .map(): 이벤트를 다른 이벤트로 변형
    * .flatMap(): 이벤트 시퀀스를 다른 이벤트 시퀀스로 변형 
       * Observable의 이벤트를 받아 새로운 Observable로 변환
    * .flatMapLatest(): Map 에서 가장 최신의 값만을 확인하고 싶을 때 사용
       * flatMap과 동일하게 이벤트가 들어오면 새로운 Observable을 생성
       * 새 Observable을 생성하면 자동적으로 이전의 Observable 구독을 해지
    * .flatMapFirst(): 이전에 생성한 Observable의 동작이 다 끝날 때까지 새로 생성한 Observable 무시
    
* Combining Operators : Sequence들을 모으고, 각 Sequence 내의 데이터를 병합하는 Operator
    * .concat()
      * 여러 Sequence를 순서대로 묶어주는 역할
      * 첫 번째 Sequence가 완료될 때까지 구독하고 다음 Sequence를 같은 방법으로 구독
      * 요소들이 같은 타입일 때 가능
   * .merge()
      * Sequence를 합치는 가장 쉬운 방법
      * 여러 Observable에 공통된 로직을 실행해야 할 때 사용
   * .combineLatest()
      * 여러 Observable에서 가장 최신의 값을 병합하여 방출
      * 모든 Observable이 하나의 값을 방출하는 순간까지 아무일도 일어나지 않음
      * 한 번 값을 방출한 이후에는 클로저가 각각의 Observable이 방출하는 최신의 값을 받음
  * .zip()
      * 발생 순서가 같은 Event 끼리 병합하여 방출
      * 이벤트끼리 쌍을 이루지 않으면 방출하지 않음
  * .withLatestFrom()
      * 한쪽 Observable의 이벤트가 발생할 때 두개의 Observable을 병합
  * .scan()
      * 값을 저장해 가지고 있을 수 있고, 그 값을 통해 이벤트를 변형할 수 있음
      * 변형하는 이벤트의 타입은 원본 이벤트 타입과 같아야 함
      * 초기값을 지정해야 함
      
* RXcocoa
* Kakao API
