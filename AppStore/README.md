앱 스토어 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/205567830-f658b6b3-d2f4-443f-b080-28557b89e43b.gif" width="300" height="550"/>

* UITabBarController와 UICollectionView를 사용하여 AppStore와 유사한 레이아웃 구성 
* 공유하기 버튼 클릭시 공유하기 기능 구현
---------------------------------------

* UIActivityViewController
  * 애플리케이션 내에서 특정 아이템을 복사하거나 외부 SNS로 공유하는 내보내기 서비스는 사용자가 아이템을 다양한 방식으로 활용하도록 도와주는 Controller
  * Acitivity Item
    * 문자열(String)
    * URL 링크(String)
    * 이미지(UIImage)
    * UIActivityItemSource 프로토콜을 따르는 커스텀 타입의 인스턴스
  * Activity Type
    * addToReadingList: 읽기 목록에 추가
    * airDrop: 에어드롭으로 공유하기 
    * assignToContact: 연락처에 지정
    * copyToPasteboard: Paste Board에 복사
    * mail: 메일 보내기
    * message: 메시지 보내기
    * openInIBooks: iBooks에서 열기
    * postToFacebook: 페이스북에 공유하기   
    * postToFlickr: Flickr에 공유하기  
    * postToTencentWeibo: Tencent Weibo에 공유하기  
    * postToTwitter: 트위터에 공유하기  
    * postToVimeo: Vimeo에 공유하기  
    * postToWeibo: SinaWeibo에 공유하기  
    * print: 프린트
    * saveToCameraRoll: 카메라 롤에 저장하기
    * markupAsPDF: PDF 생성(iOS 11 부터 사용가능)
