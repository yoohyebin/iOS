일기 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/204124754-16cba7c3-1cb4-4362-a5e0-83ba917508db.gif" width="300" height="550"/>

* "+" 버튼을 클릭하여 새로운 일기를 작성
* 일기 작성 페이지에서 제목, 내용, 날짜를 모두 입력해야만 등록 가능
* 작성된 일기는 날짜에 따라 정렬
* 작성한 일기를 클릭하면 일기의 제목, 내용, 날짜가 나타남
* "수정" 버튼을 클릭하여 수정 가능, "삭제" 버튼을 클릭하여 삭제 가능

<img src="https://user-images.githubusercontent.com/55949986/204124759-f1f25cea-3f4d-476c-b800-4d2ba7df7d24.gif" width="300" height="550"/>

* 작성된 일기를 클릭하여 "별" 버튼을 클릭하면 즐겨찾기 탭에 나타남
---------------------------------------

* UITabBarController
  * 다중 선택 인터페이스를 관리하는 컨테이너 뷰 컨트롤러
  * 선택에 따라 어떤 자식 뷰 컨트롤러를 보여줄 것인지 결정
  <img src="https://user-images.githubusercontent.com/55949986/204254608-393be101-80f6-452e-97ef-285718f0c8bd.png" width="300" height="200"/> <br>


* UICollectionView
  * 데이터 항목의 정렬된 컬렉션을 관리하고 커스텀한 레이아웃을 사용해 표시하는 객체
* UICollectionViewFlowLayout
  1. Flow레이아웃객체를작성하고컬렉션뷰에이를할당한다.
  2. 셀의 width, height 를 정한다.
  3. 필요한경우셀들간의좌우최소간격,위아래최소간격을설정한다.
  4. 섹션에header와footer가있다면이것들의크기를지정한다.
  5. 레이아웃의스크롤방향을설정한다.
* UICollectionViewDataSource
  * 컬렉션 뷰로 보여지는 콘텐츠들을 관리하는 객체
* UICollectionViewDelegate
  * 콘텐츠의 표현, 사용자와의 상호작용과 관련된 것들을 관리하는 객체
  
  
* NotificationCenter
  * notification이 오면 observer pattern을 통해서 등록된 옵저버들에게 notification을 전달하기 위해 사용하는 클래스
  * notification을 발송하면 NotificationCenter에서 메세지를 전달한 observer를 처리할 때까지 대기
* Notification
  * NotificationCenter를 통해 정보를 저장하기 위한 구조체
  * 옵저버들에게 전달되는 구조체로 정보가 담겨있고, 해당 알림을 등록한 옵저버에게만 전달
