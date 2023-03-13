도서리뷰 애플리케이션
===========
<img src="https://user-images.githubusercontent.com/55949986/205566056-5d4a26ee-0ceb-4877-a2a9-beff78ed8ff9.gif" width="300" height="550"/>

* 네이버의 검색 API 사용
* UIKit을 사용하여 개발
<br>

* main화면에서 tableView를 사용하여 책 사진과 책 제목, 작성한 메모 표시
* "+" 버튼을 클릭하면 책을 검색하여 main 화면에 표시 가능
    * 책 제목 클릭 시 search bar가 나타나며 책 검색 가능
    * 책을 검색해서 선택하면 책 제목과, 하단 이미지에 선택한 책 표시
    * 메모는 선택적으로 작성가능
    * 책 제목을 선택하지 않은 경우, "save" 버튼을 클릭하더라도 아무 동작을 하지 않음
    * 책 제목을 선택한 후 "save" 버튼 클릭 시, 입력 화면이 종료되고 main 화면으로 이동하고 저장한 책이 tableView 상단에 나타남

---------------------------------------

* MVP Architecture
    * Model-View-Presenter로 이루어진 디자인 패턴
    * MVC는 Model과 View가 연결되어 의존관계를 갖게됨, 이러한 의존성 문제를 해결하기 위해 파생된 패턴
    * Model과 View가 분리되어 있고, 오직 Presenter를 통해서 상태나 변화를 알려줄 수 있음
    * 사용자 인터페이스 개발을 위해 대부분 사용됨
    <img src="https://user-images.githubusercontent.com/55949986/224636145-433df5af-bdda-4ff6-bc4b-0a99584b7bb3.png" width="300" height="550"/>

    * Model: 애플리케이션에서 사용되는 데이터와 그 데이터를 처리하는 부분
    * View: 사용자에게 보여지는 UI 부분
    * Presenter: View에서 요청한 정보로 Model을 가공하여 View에 전달
    <br>

    * MVP 동작 과정
        1. View에 사용자의 인터랙션이 들어온다.
        2. View는 데이터를 Presenter에 요청한다.
        3. Presenter는 Model에게 데이터를 요청한다.
        4. Model은 Presenter에서 요청받은 데이터를 응답한다.
        5. Presenter는 Model에게 데이터를 응답한다.
        6. View는 Presenter가 응답한 데이터를 이용하여 화면에 나타낸다.

    * 장점
        * View와 Model의 의존성이 없음
        * View와 비지니스 로직이 완전히 분리되어 테스트에 용이
    * 단점
        * View와 Presenter 사이의 의존성이 높음
        * 애플리케이션이 복잡할수록 View와 Presenter 사이의 의존성이 높아짐

* Test
    * Unit Test
        * 기능 단위의 테스트 코드를 작성하는 것
        * 모든 기능(메서드)에 대한 테스트케이스를 작성하는 절차
        * 단위테스트의 장점
            * 코드 변경으로 인한 디버깅을 빠르게 해줌
            * 단위테스트를 믿고 리팩토링을 편하게 할 수 있으며, 리팩토링 후 단위테스트로 재검증이 가능
        * FIRST : 좋은 단위테스트 작성 원칙
            * Fast : 빠른. 테스트는 빠르게 실행되어야 함
            * Isolated : 독립된. 테스트는 따로 설정이나 분리를 해서는 안 됨
            * Repeatable : 반복 가능한. 테스트를 반복 수행해도 같은 결과여야 함
            * Self-validating : 자체 검증. 테스트는 완전히 자동화되어야 함, 테스트 결과를 또 해석할 필요 없이, pass 또는 fail을 출력
            * Timely : 적시에. 테스트 코드는 개발 전에 작성

    * UI Test
        * User Interface Testing
        * 실제로 앱이랑 상호작용하는 테스트


* XCTest
    * Xcode 프로젝트에 대한 단위 테스트, 성능 테스트 및 UI 테스트를 만들고 실행하는 프레임 워크
    * 