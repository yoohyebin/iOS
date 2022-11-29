영화 추천 애플리케이션 만들기
===========
<img src="https://user-images.githubusercontent.com/55949986/204124769-d0028d94-31f4-4d80-a3c5-dfb63a0dc455.gif" width="300" height="550"/>

* UICollectionView를 이용하여 netflix style의 영화 추천앱 레이아웃 구성
---------------------------------------

#### UICollectionView
<img src="https://user-images.githubusercontent.com/55949986/204504644-c3804287-b88c-4fed-93c7-af99fc257e89.png" width="600" height="550"/>

* Top-level Containment and Management
  * UICollectionView, UICollectionViewController
  * 시각적인 요소 정의
  * UIScrollView 상속
  * Layout 정보 기반 데이터 표시

 * Content Mamagement
  * UICollectionViewDataSource protocol
    * 필수 요소
    * Content 관리 및 Content 표시에 필요한 View 생성
  * UICollectionViewDelegate protocol
    * 선택 요소
    * 특정 상황에서 View 동작 custom

* Presentation
  * UICollectionViewReusableView, UICollectionViewCell
  * Header, Footer...
  * 재사용 가능

* Layout
  * UICollectionViewLayout, UICollectionViewLayoutAttributes, UICollectionViewUdateItem
  * 각 항목 배치 등 시각적 스타일 담당
  * View를 직접 소유하지 않는대신 Attributes 생성
  * 데이터 항목 수정시 UpdateItem 인스턴스 수신

* FlowLayout
  * UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout protocol
  * Grid, line-based layout 구현
  * 레이아웃 정보를 동적으로 Custom

<p>
<p>
* SnapKit
   * https://github.com/SnapKit/SnapKit
  * 짧은 코드로 autolayout을 표현할 수 있도록 도와주는 프레임워크
