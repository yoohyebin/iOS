내 근처 편의점 찾기 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/205566056-5d4a26ee-0ceb-4877-a2a9-beff78ed8ff9.gif" width="300" height="550"/>

* 사용자의 현재위치를 기준으로 주변의 편의점을 보여줌
* 화면 중앙을 기준으로 상단에는 카카오 맵을 보여줌
* 빨간색 핀을 사용하여 어디에 편의점이 있는지 표시
* 하단에는 편의점의 목록을 보여줌
* 주변에 편의점이 없거나 오류 발생 시, alert으로 오류 
---------------------------------------
* MVC 패턴
  * Model + View + Controller
  * 대부분의 앱에서 쓰이는 간단한 패턴
  * 애플의 MVC 패턴은 View와 Controller가 강하게 연결되어 있어 ViewController 가 너무 많은 일을 하게됨
  * Controller: 가운데에서 Model과 View 모두를 업데이트하는 역할
  * View: 데이터들을 화면에 보여주는 역할
  *  Model: 앱의 상태 지속을 위해 데이터를 읽고 쓰는 역할

<img src="https://user-images.githubusercontent.com/55949986/205870310-39027252-cdba-461e-921b-ee7b0c42cbf2.png" width="650" height="200"/>


* MVC 패턴
  * Model + View + ViewModel
  * ViewModel 은 View를 표현하기 위해 만들어진 Model
  * ViewModel은 비즈니스 로직을 관리하고 센터 역할로 Model과 View 사이에서 통신
  * MVVM 규칙
    1. Model은 다른 클래스들이 데이터 변경에 대한 notification을 보내지만이들과 직접 통신하지 않음
    2. ViewModel은 Model과 통신하며 데이터 ViewController(View)로 내보냄
    3. ViewController는 View Life Cycle을 처리하고, 데이터를 UI 구성요소에 bind할 때만 View Model 및 View와 통신
  * 비지니스 로직으로부터 View의 생명주기를 분리해, ViewController와 View 모두에 대해 명확하게 테스트 가능
  * ViewModel 은 UI 단에서 완전히 분리되어있고, 필요시에 재사용이 가능
  
<img src="https://user-images.githubusercontent.com/55949986/205870853-f855788e-2c30-4fef-9063-a5bb86d2fd9d.png" width="700" height="200"/>
