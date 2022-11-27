계산기 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/170426368-c2690e18-f01e-4b68-b62b-5da2b6c139ec.gif" width="300" height="550"/>

* 아이폰 기본 계산기 앱과 유사한 계산기 앱
* 숫자를 보여주는 label과 여러개의 button으로 구성
* 숫자 버튼 클릭 시 label에 해당 숫자 출력
* 사칙연산 가능
* 누적 연산 가능
* AC 버튼 클릭 시 label에 있던 숫자가 0으로 초기화
---------------------------------------

* UIStackView
    * 열 또는 행에 뷰들의 묶음을 배치할 수 있는 간소화된 인터페이스
    * 간단하게 UI를 구성할 수 있음
    * Axis
      * StackView의 방향 결정 (vertical: 수직, horizontal: 수평)
    * Distribution
      * StackView 안에 들어가는 뷰들의 사이즈를 어떻게 분배할지 설정하는 속성     
    * Alignment
      * StackView의 subView들을 어떤식으로 정렬할지 결정하는 속성
    * Spacing 
      * StackView 안에 들어가는 뷰들의 간격을 조정하는 속성


* IBInspectable
   *  소스 코드와 스토리보드의 Inspector Area를 연결
   *  Inspector Area에 원하는 attribute 추가 가능
* IBDesignabel 
   *  변경된 속성이 실시간으로 스토리 보드에 적용되는것을 확인 

< IB = Interface Builder>
