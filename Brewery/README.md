맥주 추천 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/204124769-d0028d94-31f4-4d80-a3c5-dfb63a0dc455.gif" width="300" height="550"/>

* API를 통해 데이터를 가져와 맥주 리스트를 보여줌
* 맥주를 클릭하면 해당 맥주의 상세 정보를 보여줌
---------------------------------------

* OSI 모델 (Open Systems Interconnection)
  * <img src="https://user-images.githubusercontent.com/55949986/204507563-b3ea9a9e-a747-43d3-a63a-cf42046cc526.png" width="300" height="400"/>
  * 다양한 통신 시스템이 표준 프로토콜을 사용하여 통신할 수 있도록 국제 표준화 기구가 만든 개념 모델

* URL (Uniform Resource Locator)
  * 인터넷에서 웹 페이지, 이미지, 비디오 등 리소스의 위치를 가리키는 문자열
 
* HTTP
  * Request: Method, URL, Header, Body 로 구성
    * Get 식별된 데이터 가져오기
    * Post 새 데이터를 추가
    * Put 식별된 기존의 데이터 수정(업데이트) 
    * Patch PUT과 동일하지만 데이터의 일부를 수정 
    * Delete 식별된 데이터 삭제
    * Head GET과 동일하지만 메시지 헤더만 반환 
    * Connect 프락시 기능 요청
    * Options 웹서버에서 지원하는 메소드 확인 
    * Trace 원격 서버 테스트용 메시지 확인
  * Response: Status Code, Message, Header, Body 로 구성
    * 1xx:정보전달-리퀘스트수신,진행중
    * 2xx: 성공- 리퀘스트 성공적으로 수신, 해석, 승인 
    * 3xx: 리다이렉션
    * 4xx: 클라이언트 에러
    * 5xx: 서버 에러

* URLSession
  * 특정한 url을 이용하여 앱에서 서버와 통신하기 위한 API
  * HTTP를 포함한 몇 가지 프로토콜을 지원하고 인증, 쿠키 관리, 캐시 관리 등을 지원

* URLSessionConfiguration
  * URLSession을 생성하기 위해서 필요한 요소
  * Configuration을 생성할 때는 URLSession 정책에 따라서 default, ephemeral, background 세 가지 형태로 생성
    * Default : 기본 통신으로 디스크 기반 캐싱을 지원
    * Ephemeral : 쿠키나 캐시를 저장하지 않는 정책을 가져갈 때 사용
    * Background : 앱이 백그라운드에 있는 상황에서 컨텐츠 다운로드, 업로드를 할 때 사용
    
* URLSession Delegate
  * 네트워크 중간 과정을 확인할 수 있음 
  * 필요에 따라서 사용

* URLSession Task
  * DataTask
    * Data를 받는 작업, Response 데이터를 메모리 상에서 처리
    * 백그라운드 세션에 대한 지원이 되지 않음
    * URL 요청을 실시하고 완료 시 핸들러를 호출하는 Task 형식
    * Task가 실행된 후 핸들러가 실행되기 때문에 탈출 Closure 형태로 받아야 함
  * UploadTask
    * 파일을 업로드할 때 사용 
  * DownloadTask
      * 파일을 다운로드 받아 디스크에 쓸 때 사용

* URLSession Life Cycle
<img src="https://user-images.githubusercontent.com/55949986/204509923-7f014d38-a71e-4170-90dd-dfc957c06255.png" width="500" height="100"/>
