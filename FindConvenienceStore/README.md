내 근처 편의점 찾기 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/205566056-5d4a26ee-0ceb-4877-a2a9-beff78ed8ff9.gif" width="300" height="550"/>

* 사용자의 현재위치를 기준으로 주변의 편의점을 보여줌
* 화면 중앙을 기준으로 상단에는 카카오 맵을 보여줌
* 빨간색 핀을 사용하여 어디에 편의점이 있는지 표시
* 하단에는 편의점의 목록을 보여줌
* 주변에 편의점이 없거나 오류 발생 시, alert으로 오류 표시
<br>

* RXSwift를 사용하여 MVVM pattern으로 개발

---------------------------------------

* CLLocationManager
  *  Core Location 서비스를 구성하고, 시작하고 중지할 수 있음
  *  location manager 객체는 다음과 같은 location과 관련된 활동들을 지원
     * 사용자의 현재위치에서 크거나 작은 변화를 추적
     * 나침반에서 방향 변경 추적
     * 사용자 위치 기반 이벤트 생성
     * 근거리 통신기기(Bluetooth Beacon)와 통신
  * 위치 권한 설정
    *  When In Use : app이 사용되고 있는 동안에 location service와 이벤트들을 받을 수 있음
    *  Always : 사용자가 app이 실행되는지 몰라도 location service와 이벤트들을 받을 수 있음
  
* KakaoMapAPI
  * Guid: https://apis.map.kakao.com/ios/guide/
  * 로컬: https://developers.kakao.com/docs/latest/ko/local/dev-guide#search-by-keyword
  * 로컬 API의 여러 기능 중, 카테고리 검색 기능 사용
<br>

* Unit Test
  * 단위 테스트: 프로그램의 기본 단위인 모듈을 테스트
  * 모듈이 제대로 구현되어 정해진 기능을 정확히 수행하는지 테스트
  * 프로그램의 각 부분을 고립시켜 각각의 부분이 정확하게 동작하는지 확인
  * Unit Test의 구조가 잡혀있으면 추후 리팩토링 후 확인이 쉬워 변경이 쉬움

* XCTest
  * Xcode 프로젝트에 대한 단위 테스트, 성능 테스트 및 UI 테스트를 만들고 실행

* XCTestCase
  * Xcode에서 사용하는 테스트 클래스의 기반
  * 테스트에 필요한 기본적인 기능을 제공
  * 모든 테스트 클래스는 XCTestCase를 상속받아 구현해야 함
  * setup(): 테스트 코드 시작 전 실행 (값을 세팅하는 부분)
  * teardown(): setUp과 반대로 모든 테스트코드가 실행된 후에 호출 (setUp에서 설정한 값들을 해제 시 사용)

* Nimble
  *  Nimble은 Apple에서 제공하는 XCTest Assertion에서 단점을 극복하기 위해 만들어짐
  *  expect.to() method를 이용하여 가독성 높은 코드 작성이 가능함

* RXTest
  * Observable에 시간 개념을 주입
  * 임의의 Observer를 통해 subscribe 여부 관계 없이 검증 가능
  * Scheduler의 개념이 필요하고 좀 더 원하는 타이밍에 원하는 값이 나오기 검증을 원할는 경우 사용

* RxBlocking
  * Observable의 Event 방출을 검증
  * 특정 시간동안 방출된 Observable의 Event 검증
  * RxTest의 Scheduler 개념 X
  * 단순 Observable이 제대로 방출되는지 확인을 원하는 경우 사용
