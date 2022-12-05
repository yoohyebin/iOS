물마시기 알람 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/205564973-93a1fc52-190e-484c-afe4-831f6b111612.gif" width="300" height="550"/>

<img src="https://user-images.githubusercontent.com/55949986/205564988-b4db709a-1b33-421a-9fa7-dedcc591fa14.png" width="300" height="550"/>

* "+" 버튼 클릭시 알람을 추가할 시간을 Date Picker로 선택 가능
* 생성된 알람이 화면에 표시, switch 버튼으로 알람을 on, off 가능
* 알람이 on 상태라면, 정해진 시간에 알람이 발생
---------------------------------------

* Local Notification
  * 푸시 알람, 푸시 메시지로 일컫는 기기 메시지의 형태
  * 외부 네트워크를 거치는 형태가 아닌 기기 내부에서 발신하는 오프라인 푸시 

* UNNotification Request (UserNotification)
  * Local Notification을 보내기 위한 알림 요청
  * identifier: 각각의 요청을 구분할 수 있는 고유한 값
  * Content: 알림에 나타날 내용 정의
     * title, body...
  * Trigger: 어떤 조건에서 알람을 발생 시킬지 정의
    * Calendar
    * TimeInterval
    * Location

* Notification Center
  * notification이 오면 observer pattern을 통해서 등록된 옵저버들에게 notification을 전달하기 위해 사용하는 클래스
  * request를 만들어 Notification Center에 추가
  * request의 trigger의 정의에 따라 알림 발생
  
