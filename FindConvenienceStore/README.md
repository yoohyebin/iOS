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
