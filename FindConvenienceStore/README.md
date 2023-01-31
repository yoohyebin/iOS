내 근처 편의점 찾기 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/205566056-5d4a26ee-0ceb-4877-a2a9-beff78ed8ff9.gif" width="300" height="550"/>

* 사용자의 현재위치를 기준으로 주변의 편의점을 보여줌
* 화면 중앙을 기준으로 상단에는 카카오 맵을 보여줌
* 빨간색 핀을 사용하여 어디에 편의점이 있는지 표시
* 하단에는 편의점의 목록을 보여줌
* 주변에 편의점이 없거나 오류 발생 시, alert으로 오류 표시
---------------------------------------

* CLLocationManager
  * Model + View + Controller
  * 대부분의 앱에서 쓰이는 간단한 패턴
  * 애플의 MVC 패턴은 View와 Controller가 강하게 연결되어 있어 ViewController 가 너무 많은 일을 하게됨
  * Controller: 가운데에서 Model과 View 모두를 업데이트하는 역할
  * View: 데이터들을 화면에 보여주는 역할
  *  Model: 앱의 상태 지속을 위해 데이터를 읽고 쓰는 역할

* KakaoMapAPI
 * Guid: https://apis.map.kakao.com/ios/guide/
 * 로컬: https://developers.kakao.com/docs/latest/ko/local/common
