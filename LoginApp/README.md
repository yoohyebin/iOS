로그인 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/204523196-cf4711d4-2cdb-4401-ae22-7ab5231cb1e5.gif" width="300" height="550"/>

* "이메일/비밀번호로 로그인" 버튼 클릭시 이메일 주소와 비밀번호를 입력해 로그인
  * "프로필 변경" 버튼 클릭 시 미리 지정해둔 닉네임으로 변경
  * 이메일로 로그인시 "비밀번호 변경" 버튼 표시
  
  <img src="https://user-images.githubusercontent.com/55949986/204523185-9cb433fe-64e8-43e4-9d49-151dd5e70a89.gif" width="300" height="550"/>
  
  * 잘못된 비밀번호 입력, 짧은 비밀 번호 입력 등 오류 발생 시 에러 메시지 표시
  
<img src="https://user-images.githubusercontent.com/55949986/204523945-c0407bed-7043-4e76-8736-f520083b4fa9.gif" width="300" height="550"/>
* "구글로 로그인" 버튼 클릭시 구글에 가입된 계정으로 로그인 가능
* 애플로 로그인은 아직 구현 못함

* 로그인 성공 시 로그아웃 버튼 클릭 시 로그아웃 가능
---------------------------------------

* Firebase
  * 구글(Google)에서 제공하는 모바일 애플리케이션 개발 플랫폼
  * 백엔드를 쉽게 구현 

* Firebase Auth
  * 사용자 인증 방식에 대한 업계 표준
  * ID/PW를 노출하지 않고 OAuth를 사용하는 업체의 API 접근 권한을 위임 받음

    * User: Service Provider에 계정을 가지고 있는 사용자
    * Consumer: Service Provider의 API (제공 기능)를 사용하려는 서비스 (앱, 웹 등)
    * Service Provider: OAuth를 사용하여 API를 제공하는 서비스
    * Access Token: 인증 완료 후 Service Provider의 제공 기능을 이용할 수 있는 권한을 위임받은 인증 키
