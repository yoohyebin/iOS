스타벅스 애플리케이션
===========
<img src="https://user-images.githubusercontent.com/55949986/205566056-5d4a26ee-0ceb-4877-a2a9-beff78ed8ff9.gif" width="300" height="550"/>

* 스타벅스 스타일의 애플리케이션
* Swift UI를 사용하여 개발
<br>

* 2개의 탭으로 구성
* Home 탭
    * 헤더 뷰
        * user name을 화면에 표시
        * Refresh 버튼 클릭 시 메뉴와 이벤트 정보가 랜덤으로 순서 변경
    * 메뉴 추천 뷰
        * ScrollView를 가로로 설정하고, LazyHStack을 사용하여 가로로 드래그 가능한 뷰 구성
        * VStack을 사용하여 메뉴 사진과 이름을 세로로 쌓아 화면에 나타냄
    * 이벤트 뷰
        * 메뉴 추천 뷰와 동일하게 구성
* Other 탭
    * List를 사용하여 표현 (GropListStyle)
    * 톱니바퀴 버튼 클릭 시 setting 화면으로 넘어감

---------------------------------------

* HStack
    * 내부에 선언된 View들을 Trailing으로 배치 (수평) 
    * 전체 데이터를 메모리에 담아두고 스크롤 할 때마다 보여줌 (한 번에 데이터 생성)
* LazyHStack
    * 내부에 선언된 View들을 Trailing으로 배치 (수평) 
    * 데이터가 화면에 렌더링 되는 순간 보여지는 순간 그려짐
    * 뷰를 recycling할 가능성이 높음
    * 너비가 유연, 일반 스택과 달리 여유 공간 차지
    * 메모리 사용량 감소
* List
    * 목록(List) 인터페이스를 구현하기 위해 존재
    * UIKit의 UITableView와 유사
    * List 클로저 안에 subView들을 넣어서 구현