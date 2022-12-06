GitHub 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/205565862-63b5bb50-a0c9-4753-906e-79a1a791baec.gif" width="300" height="550"/>

* RXSwift를 사용하여 앱을 생성
* UITableView를 사용하여 apple github의 Repositories를 보여
---------------------------------------

### RXSwift
* RXSwift
  * 관찰 가능한 연속성(순차적)형태와 함수형태의 연산자를 이용해서 비동기&이벤트를 위한 코드로 구성하고 있는 라이브러리
  * 변화할 수 있는 상태에 쉽게 대처 할 수 있고, 이벤트들의 순서의 구성과, 코드 분리, 재사용성등을 향샹 시킬 수 있음
  * Observables: 데이터의 스냅샷을 전달할 수 있는 이벤트 시퀀스를 비동기적으로 생성하는 기능
  * Operators: ObservableType과 Observable 클래스에 포함된 복잡한 논리를 구현하기 위한 메서드
  * Schedulers: Dispatch Queue와 같지만 훨씬 쉽고 강력
      * DispatchQueue: 작업 항목의 실행을 관리하는 클래스
   
* Observables
  * Rx 코드의 기반
  * T 형태의 데이터 snapshot을 '전달' 할 수 있는 일련의 이벤트를 비동기적으로 생성하는 기능 
  * 하나 이상의 observers가 실시간으로 어떤 이벤트에 반응
  * Observable 들은 일정 기간 동안 계속해서 이벤트를 생성 (emit)
  * 세 가지 유형의 이벤트만 방출
    * next
    * error
    * completed
   
* Observables 생명주기
   * Observable은 어떤 구성요소를 가지는 next 이벤트를 계속해서 방출할 수 있음 
   * Observable은 error 이벤트를 방출하여 완전 종료될 수 있음
   * Observable은 complete 이벤트를 방출하여 완전 종료 될 수 있다.
 
* Observables 생성
   * just: 오직 하나의 Element를 포함하는 Observable Sequence를 생성
   * of: 가변적인 element를 포함하는 Observable Sequence를 생성
   * from: array의 요소들로 Observable Sequence 생성
   * empty: 요소를 가지지 않는 Observable
   * never: empty와는 반대, 이벤트를 방출 조차 하지 않음
   * range: start 부터 count크기 만큼의 값을 갖는 Observable을 생성
   * repeatElement: 지정된 element를 계속 Emit
   * interval: 지정된 시간에 한번씩 event를 emit
   * create: Observer에 직접 Event를 방출

* Trait
   * 일반적인 Observable보다 좁은 범위의 Observable
   * 옵션으로 사용, 코드 가독성 상승
   * single
      * Obvservable의 한 형태
      * 항상 한 가지 값 또는 오류 알림 둘 중 하나만 배출
      * .success(value)나 .error 이벤트를 방출
    * Completable 
      * .completed나 .error를 방출
      * 값을 방출하지 않음
    * Maybe
      * Single 과 Completable을 섞어 놓은 형태
      * .success(value) , .completed , .error 를 방출
      * 프로세스가 성공, 실패 여부와 더불어 출력된 값도 방출 
      
* Subject
   * Observable이자 Observer인것
   * PublishSubject
      * .completed, .error이벤트가 발생할때까지 이벤트를 방출
      * 빈 상태로 시작하여 새로운 값만을 subscriber에 이벤트를 방출
   * BehaviorSubject
      * PublicshSubject와 유사하지만, 초기값을 가지며 항상 직전의 값부터 구독
      * 하나의 초기값을 가진 상태로 시작하여, 새로운 subscriber에게 초기값 또는 최신값을 방출
   * ReplaySubject
      * 생성시 선택한 특정 크기만큼 일시적으로 캐시하거나 버퍼를 저장해서 최신 요소를 모두 방출
      * 버퍼를 두고 초기화하며, 버퍼 사이즈 만큼의 값들을 유지하면서 새로운 subscriber에게 방출

* Disposing and Terninating
   * dispose(): 구독을 취소하여 Observable을 수동으로 종료
   * DisposeBag(): Disposable 들을 모아놨다가 한번에 처분하는 방식
