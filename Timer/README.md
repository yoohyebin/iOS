뽀모도로 타이머 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/204124763-4c3bda60-b8ae-4ce6-b6b8-8684a523d6eb.gif" width="300" height="550"/>
* DatePicker를 통해 타이머 시간 설정<p>
* "시작" 버튼 클릭 시 타이머 시작, "일시 정지" 버튼 클릭 시 타이머 일시 정지<p>
* "취소" 버튼 클릭 시 타이머 종료<p>
<p>
<img src="https://user-images.githubusercontent.com/55949986/204124762-c0eb90f2-53e3-4c27-9da8-d9d8347524f2.gif" width="300" height="550"/>
* 카운트 다운이 완료되면 알람으로 알려줌<br>
---------------------------------------

* DispatchSourceTimer
  * 타이머를 기반으로 해서 event handler 블럭을 제공하는 Dispatch source
  * makeTimerSource(flags:queue:) 메서드를 사용하여 이 프로토콜을 채택하는 객체를 만들어야함

* UIViewAnimation
  * UIView 클래스는 Animation에서 사용되는 API를 타입메소드로 제공
    * frame
    * bounds
    * center
    * transform
    * alpha
    * backgroundColor
