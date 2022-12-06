자산관리 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/205565691-003f2369-e40a-47d4-8717-4e4d0435512f.gif" width="300" height="550"/>

* textField에 도시 이름을 입력한 후 "날씨 가져오기 버튼을 클릭하면" 해당 도시의 날씨가 나타남
* 잘못된 도시를 입력한 경우 알림창으로 잘못됐다는것을 알려줌
---------------------------------------

* SwiftUI
  * iOS, iPadOS, macOS 등 모든 Apple 플랫폼에 대한 사용자 인터페이스 및 동작을 선언하는 방법
  * 앱의 사용자 인터레이스를 선언하기 위한 View, control, layout을 구조체로 제공
  * 이벤트 핸들러와 앱 모델에서 사용자가 보고 상호 작용하는 보기 및 컨트롤까지의 데이터 흐름을 관리하는 도구를 제공
  * UIKit 및 AppKit과 호환되도록 설계되어 기존 앱에 추가로 적용 가능
  * 선언형 프로그래밍 방식
      * 프로그램이 어떤 방법으로 해야하는지를 나타내기보다 무엇과 같은지를 설명하는 프로그래밍 패러다임의 일종
      * 알고리즘을 명시하지 않고 목표를 명시
      
* SwiftUI LifeCycle
  * onAppear: view가 나타날때 수행할 action 추가
  * OnDisappear: view가 사라질때 수행할 action 추가
  
* @State
  * 변화가 생기면 해당 변수의 값을 읽거나 새로 쓸 수 있음을 의미하는 property wrapper
  * SwiftUI 는 state 로 선언된 property 들의 저장소를 관리
  * State value 값이 변경되면 뷰는 해당 value 의 appearance 를 무효화 하고 다시 body 값을 계산
  * state 변수값이 변경되면 view 를 다시 랜더링 하기 때문에 항상 최신 값을 가짐
  * State 인스턴스는 그 자체로 값이 아닌, 값을 읽고 쓰는 것을 의미함
  * 현재 뷰 UI의 특정 상태를 저장하기 귀해 만들어진 것이기 때문에 보통 private
  * @State 속성으로 어떤 프로퍼티의 초기값을 지정했다면, 다른 값으로 재할당 불가, @Binding 변수를 통해서만 가능
  
* @Bining
  * 다른 뷰에서 @State 속성으로 선언된 프로퍼티를 사용한다면 @Binding 속성을 사용
  * 사용시에는 $를 앞에 붙여 binding 변수임을 나타냄
  * 외부에서 접근해야 하기 때문에 private X

* App
  * 프로토콜, 앱의 동작과 구조를 정의한다.
  * App 프로트콜을 준수하는 구조체를 정의해 앱 생성
  * body 프로퍼티를 실행해 앱의 내용 정의
  * 구조체 정의 부분 앞쪽에 @main 표시를 통해 앱의 진입점을 나타낼 수 있으며, 앱 전체에서 하나만 존재

* Scene
  * 프로토콜, 시스템에 의해 관리되는 life cycle 을 가진 앱 user interface 의 한 부분
  * 시스템은 현재 앱 상태에 맞게 언제, 어떻게 현재 플랫폼에 맞는 뷰 계층을 표현할지를 결정
  * 각 Scene 은 UI 를 공유하지만 모두 각 Scene 만의 독립적인 상태를 가짐
  * App의 body에 Scene 프로토콜을 준수하는 1개 이상의 인스턴스들을 결합 가능
  * WindowGroup 과 같이 SwiftUI 에서 제공하는 built-in Scene 들을 사용 하거나, custom Scene 을 사용 가능
  
* View
  * 프로토콜, 앱의 user interface를 나타내고 view를 구성하기 위한 modifier를 제공
  * view 는 Scene의 내용, content를 나타내고 View 프로토콜을 채택하면 View 프로토콜을 준수하는 body 프로퍼티가 요구
