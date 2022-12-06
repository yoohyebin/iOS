GitHub 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/205565862-63b5bb50-a0c9-4753-906e-79a1a791baec.gif" width="300" height="550"/>

* UISearchController를 사용하여 검색하고자 하는 지하철 역을 입력 받음
* UITabelView를 사용하여 검색한 지하철 역에대한 정보를 서버로부터 받아 표시
* 역을 클릭 시 해당 역의 도착 정보 표시, UICollectionView와 Custom Cell 사용
* 화면을 밑으로 끌어내리는 액션을 취하면 새로고침 (UIRefreshControl)

</br>

* 서울 열린데이터 광장
  * https://data.seoul.go.kr
  * "서울시 지하철 정보 검색(역명)", "서울시 지하철 실시간 도착정보" api 사용
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
      
* Observables 생성
   * just: 오직 하나의 Element를 포함하는 Observable Sequence를 생성
   * of: 가변적인 element를 포함하는 Observable Sequence를 생성
   
