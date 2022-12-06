다음 검색 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/205566062-04802b86-fcc8-462f-9b6c-91bb96531c42.gif" width="300" height="550"/>

* UISearchBar를 사용하여 검색할 내용을 입력받음
* "검색" 버튼 클릭 시 해당 내용을 다음 블로그에서 검색
* 우측 상단 버튼 클릭시 정렬방법을 선택할 수 있음 (Title, Datetime)

<br/>

* Kakao API
 * https://developers.kakao.com/
 * Kakao API를 사용하여 다음 블로그 검색 내역을 
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
    * Cocoa Framework를 RX와 합친 기능을 제공하는 라이브러리
      * Cocoa Framework: apple 애플리케이션을 제작하기 위한 도구들을 모아놓은 framework
    * UI Control과 다른 SDK 클래스를 wrapping한 커스텀 extension set
    * ObserverType : 값을 주입 시킬 수 있는 타입
    * ObservableType : 값을 관찬할 수 있는 타입

* ControlProperty
  * subject와 같이 프로퍼티에 새 값을 주입시킬 수 있고(ObserverType), 값의 변화도 관찰할 수 있는 타입
  
* Binder
  * ObserverType을 따름
  * 값을 주입시킬 수는 있지만, 값을 관찰할 수 없음
  * error를 값으로 받을 수 없음, error가 주입되면 fatalError발생
  * Publisher에서 Subscriber로 향하는 단방향 binding

* Traits
  * UI작업시 코드를 쉽고 직관적으로 작성해 사용할 수 있도록 도와주는 특별한 Observable클래스 모음
  * error를 방출하지 않음
  * 메인 스케줄러에서 obsere, subscribe됨
  * signal을 제외한 나머지들은 자원을 공유함
  * Trait 종류
     * ControlProperty : 컨트롤에 data를 binding하기 위해 사용(rx namespace 사용)
     * ControlEvent : 컨트롤의 event를 수신하기 위해 사용
     * Driver : error를 방출하지 않고 메인스레드에서 처리됨
     * Signal : Driver와 유사하지만 자원을 공유하지않음 (Signal은 event모델링에 유용, Driver는 state모델링에 더 적합
     
* RxSwift 에러 관리
    * Catch: 기본값(defaultValue)로 error를 복구
      * 에러 없이 sequence를 지속하여 onError알림에서 복구
      * 소스 observable에서 onError알림이 오면, 관찰자에게 전달하지 않고 이를 가로채서 item으로 대체하여 결과 observable이 정상적으로 종료, 혹은 종료되지 않도록 함
    * CatchAndReturn: error의 종류에 관계없이 "error"를 next 이벤트로 반환합니다.
      * element: 에러가 발생한 경우 observable sequence의 마지막 item
      * 만약 구독 전에 catchAndReturn을 해주지 않았다면 "Unhandled error happened: error1" 라고 출력
    * Retry: 제한적, 혹은 무제한적으로 재시도
      * 만약 소스 observable에서 error가 발생한다면 오류 없이 완료(종료)되기를 바라며 재구독
      * onError 알림이 오면, 관찰자에게 이를 전달하기보다 해당 sequence를 오류 없이 종료할 수 있도록 소스 observable을 재구독
      * sequence가 error로 인해 종료되더라도 관찰자에게 항상 onNext를 전달하기때문에 중복 방출이 발생 가능
