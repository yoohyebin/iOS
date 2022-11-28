ToDo 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/204124765-787e6d59-21cf-4d8d-96b8-4cbf7a4427aa.gif" width="300" height="550"/>

* "+" 버튼을 클릭하면 새로운 할일을 등록 가능
* "edit" 버튼을 클릭하면 할일의 위치를 변경하거나 삭제 가능
* swipe 액션으로 할일 삭제 가능
---------------------------------------

* UITableView
    * 데이터를 목록 형태로 보여 줄 수 있는 가장 기본적인 UI 컴포넌트
    * 여러 개의 Cell을 가짐
    * 하나의 열과 여러 줄의 행을 지니고 있음
    * 수직으로만 스크롤 가능
    * 섹션을 이용해 행을 그룹화하여 콘텐츠를 쉽게 탐색할 수 있음
    * 섹션의 헤더와 푸터에 View를 구성하여 추가적인 정보 표시 가능
    
* UITableViewDelegate
   * UITableViewDataSource는 테이블 뷰를 생성하고 수정하는데 필요한 정보를 테이블 뷰 객체에 제공
* UITableViewDelegate
   * UITableViewDelegate는 테이블 뷰의 시각적인 부분을 설정하고, 행의 액션 관리, 엑세서리 뷰 지원
   * TableView의 개별 행 편집을 도와줌 
    
* UIAlertController
   * 앱 실행 도중에 사용자에게 메시지를 전달하고 의사를 입력받기 위한 목적으로 제공되는 객체인 메시지 창을 구현하기 위한 view controller
   * 화면 중앙에 표시되는 알림창과 화면 하단에 표시되는 액션시트 두 가지 형태로 메시지 창 표현 가능
   * title: 사용자에게 보이는 버튼의 이름 설정
   * Style: 버튼 타입 결정
      * cancel: 아무것도 실행되지 않은 채 메시지 창의 액션이 취소된다는  것, 메시지 창 내에서 한번만 사용 가능
      * destructive: 빨간색으로 강조, 중요한 내용을 변경/삭제 하여 되돌릴 수 없는 결정을 하는 버튼에 적용
      * default: 일반적인 버튼에 사용
   * handler: 버튼 클릭 시 실행될 구문, 함수 또는 클로저로 작성


* UserDefaults
   * 런타임 환경에서 동작하며 앱이 실행되는 동안 기본 저장소(default database)에 접근해 데이터를 기록, 가져오는 역할을 하는 인터페이스
   * 싱글톤 패ㅓ
   * key-value 쌍으로 구성
   
   
 
