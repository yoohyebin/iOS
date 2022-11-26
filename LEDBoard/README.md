LED 전광판 앱 만들기
===========
![LED 전광판](https://user-images.githubusercontent.com/55949986/170426933-006b2126-ac2c-42a2-ae93-4907af7cb8b5.gif)

* 첫 화면은 색이 있는 label과 설정 버튼으로 구성되어 있다.
* 설정 버튼을 클릭하면 첫 화면에 표시될 글자를 입력하는 textfield와 텍스트 색상과 배경 색상을 선택할 수 있는 버튼이 있다.
* 설정 화면에서 선택하고 저장버튼을 클릭하면 첫화면으로 돌아가 설정한대로 표시된다.
---------------------------------------

* UINavigationController
    * 계층구조로 구성된 content를 순차적으로 보여주는 container view controller

* 화면 전환
   *  View Controller 의 View 위에 다른 View를 가져와 바꿔치기 
      * 메모리 누수 위험으로 사용하지 않음  
   *  View Controller에서 다른 View Controller 를 호출하여 전환하기 
      * present method 파라미터에 이동하려는 view controller 인스턴스를 넘겨 화면 전환  
   *  Navigation Controller 를 사용하여 화면 전환하기
      *  navigation controller에서 push method 파라미터에 이동하려는 view controller 인스턴스를 넘겨 화면 전환  
   *  화면 전환용 객체 세그웨이(Segueway) 를 사용하여 화면 전환하기
      *  스토리보드에서 view controller Scene 들 끼리 세그웨이 객체를 연결시켜 코드 없이 화면 전환

* UIViewController LifeCycle
     ![image](https://user-images.githubusercontent.com/55949986/170435366-fbb03f43-d9b9-4c24-a166-3a2089b58432.png)
   *  loadView
      *  화면에 띄워줄 view를 만드는 메소드, view를 만들고 메모리에 올림 
      *  직접 호출 하면 안됨, 모두 직접적으로 코딩하여 만드는 경우를 제외하고서는 override 하지 않는게 좋음
   *  viewDidLoad 
      *  뷰의 컨트롤러가 메모리에 로드 된 후에 호출되며 시스템에 의해 자동으로 호출 
      *  사용자에게 화면이 보여지기 전에 데이터를 뿌려주는 행위에 대한 코드 작성 가능
      *  일반적으로 리소스를 초기화 하거나, 초기화면을 구성하는 용도로 사용
      *  생에 딱 한번 호출
   *  viewWillAppear
      *  뷰 컨트롤러의 화면이 올라오고 난 후 뷰가 화면에 나타나기 직전에 호출
      *  뷰가 로드된 이후, 눈에 보이기 전에 컨트롤러에게 알리는 역할
      *  다른 뷰로 이동했다가 되돌아올때 재 호출되는 매소드로 화면이 나타날 때 마다 수행해야 하는 작업을 정의
   *  viewDidAppear
      *  뷰가 데이터와 함께 완전히 화면에 나타난 후 호출되는 메소드
   *  viewWillDisappear
      *  다음 뷰 컨트롤러 화면이 전환하기 전이나 뷰 컨트롤러가 사라지기 직전에 호출되는 메소드
   *  viewDidDisappear
      *  뷰 컨트롤러들이 화면에서 사라지고 나서 호출되는 메서드
      *  화면이 사라지고 나서 필요없어지거나 멈춰야하는 작업 코드 작성
   
* 화면간 데이터 전달
   *  프로퍼티에 직접 접근하여 데이터 전달하기
      *  instantiateViewController 메소드를 이용하여 뷰 컨트롤러가 인스턴스화 되면 프로퍼티에 접근하여 데이터 전달
      *  push, present 방식으로 화면 전환한 경우에만 사용
   *  세그웨이로 구현된 화면 전환 방법에서 데이터 전달하기
      *  prepare method를 override 하여 메서드 안에서 전환하려는 뷰 인스턴스를 가져오고, 프로퍼티에 접근하여 데이터 전달
      *  ViewController 끼리 강하게 결합되어 많은 수정이 필요할 수 있음
   *  Delegate 패턴을 이용하여 이전 화면으로 데이터 전달하기 
      *  ViewController 끼리 서로 의존하지 않고 떨어져 있는 구조 유지
