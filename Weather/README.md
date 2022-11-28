날씨 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/204124769-d0028d94-31f4-4d80-a3c5-dfb63a0dc455.gif" width="300" height="550"/>

* textField에 도시 이름을 입력한 후 "날씨 가져오기 버튼을 클릭하면" 해당 도시의 날씨가 나타남
* 잘못된 도시를 입력한 경우 알림창으로 잘못됐다는것을 알려줌
---------------------------------------

* Open Weather Map API
  * https://openweathermap.org/api
  * 무료로 날씨 API를 제공

* 웹 통신
  * 인터넷 상에서의 통신
    * Protocol: 데이터의 교환 방식을 정의하는 규칙
  
    
* Http 통신
  * Hyper Text를 전송하기 위한 프로토콜
  * Http Method
    * GET: 클라이언트가 서버에 리소스를 요청할 때 사용
    * POST: 클라이언트가 서버의 리소스를 새로 만들 때 사용
    * PUT: 클라이언트가 서버의 리소스를 전체 수정 할 때 사용
    * PATCH: 클라이언트가 서버의 리소스를 일부 수정 할 때 사용
    * DELETE: 클라이언트가 서버의 리소스를 삭제 할 때 사용 HEAD:클라이언트가서버의정상작동여부를확인할때사용
    * OPTIONS: 클라이언트가 서버에서 해당 URL 이 어떤 메소드를 지원하는지 확인 할 때 사용 CONNECT: 클라이언트가 프록시를 통하여 서버와 SSL 통신을 하고자 할 때 사용
    * TRACE: 클라이언트와 서버간 통신 관리 및 디버깅을 할 때 사용
  * Http Status
    * 100번 대 Informational: 요청 정보를 처리 중
    * 200번 대 Success: 요청을 정상적으로 처리함
    * 300번 대 Redirection: 요청을 완료하기 위해 추가 동작 필요 
    * 400번 대 Client Error : 서버가 요청을 이해하지 못함
    * 500번 대 Server Error : 서버가 요청 처리 실패함
    

* URLSession
  * 특정한 url을 이용하여 앱에서 서버와 통신하기 위한 API
  * HTTP를 포함한 몇 가지 프로토콜을 지원하고 인증, 쿠키 관리, 캐시 관리 등을 지원

* URLSessionConfiguration
  * URLSession을 생성하기 위해서 필요한 요소
  * Configuration을 생성할 때는 URLSession 정책에 따라서 default, ephemeral, background 세 가지 형태로 생성
   * Default : 기본 통신으로 디스크 기반 캐싱을 지원
   * Ephemeral : 쿠키나 캐시를 저장하지 않는 정책을 가져갈 때 사용
   * Background : 앱이 백그라운드에 있는 상황에서 컨텐츠 다운로드, 업로드를 할 때 사용
