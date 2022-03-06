# 새싹팜

기본적인 커뮤니티 기능을 갖춘 iOS 어플리케이션

## Description

- 로그인/회원가입 및 CRUD 기능 구현
- MVVM 패턴 적용
- 사용 라이브러리를 최소화하여 모든 기능 구현
- Storyboard를 활용하지 않고 코드로만 UI 구성

## Getting Started

### Skill

    Swift
    MVVM
    UIKit, AutoLayout, URLSession
    Snapkit

### Issue

* automaticdimension 이슈
    + 바텀 Constraint를 지정해주지 않아서 메서드가 작동하지 않았음.
    
* 디코딩 실패 에러(한 4시간 쓴듯) 너무 사소한 실수이지만 반복하지 않기 위해 기록.
    + 원인: 구조체의 특정 프로퍼티 타입이 json내에서 해당타입과 일치하지 않아서 생긴 에러. 구조체 내에서는 username을 Int타입으로 지정했지만 json에서 username은 String타입이었음.
   
* 테이블뷰셀의 버튼이 클릭되지 않는 이슈 발생.
    + 원인: 버튼을 테이블뷰셀에 addSubView를 해줬기 때문. 테이블뷰셀에 addSubView를 해주면 contentView의 뒤로 들어가기때문에 유저가 클릭하는 것이 블락된다.
    + 해결: 테이블뷰셀이 아닌 contentView에 addSubView를 해줌.
   
* HttpMethod에서 PUT으로 지정했으나 PUT으로 호출을 안하고 계속 디폴트 값인 GET으로 호출하는 이슈.
    + 원인: header에서 Content-type을 setValue 해주지 않아서 생긴 문제.
    + 해결: 해당값을 setValue했다.
    + 의문: post도 Content-type이 필요한데 왜 post 호출할 때는 Content-type setValue 안해도 잘 호출되는건지.
   
* 글을 수정하는 뷰컨트롤러에서 글을 수정하고 완료한 뒤 pop으로 이전화면으로 돌아오면 수정된 글이 최신화되어 있지 않는 이슈 존재.
    + 원인: 새롭게 초기화한 뷰컨트롤러의 프로퍼티에 값을 담아놓고, 이전 뷰컨트롤러로 pop 해버렸으니 당연히 프로퍼티에 값이 안담겨 있을 수 밖에. 새롭게 초기화한 뷰컨트롤러로 push해줬다. => 문제있음. 새롭게 초기화한 뷰컨트롤러로 푸쉬했더니 나머지 프로퍼티값들이 아무것도 안 담겨있음. 개선 필요.
    + 해결: 이전 뷰컨트롤러로 pop은 그대로 하지만, 이전 뷰컨트롤러 viewWillAppear 메서드에 API 호출해서 수정된 값을 넣어줌.
   
* 새롭게 갱신할때마다 API호출을 계속 하게끔 코드를 짜고 있는데, 호출을 좀 줄이면서 갱신할 수 있는 방법은 없을까.
    + 해결: 수정한 내용 바인드해서 담아주기

* 한국 시간으로 맞췄지만 시차가 여전히 존재. 개선 필요 11시간 차이 남.
    + 해결: date에 addTimeInterval 해줌. -> 실기기에서는 문제없다고 함. 실기기 테스트 필요. -> 테스트 결과 실기기 이상 없음.
   
* MainboardViewController에서 댓글버튼을 클릭하면 바로 댓글창을 FirstResponder로 해주려 했다. 그런데, 댓글창을 눌러서 넘어가면 키보드노티피케이션이 작동하지 않는 이슈.
    + 해결: RxKeyboard 적용.

* 이슈는 아니지만 API 호출로 받아오는 JSON 데이터들의 이름이 모두 비슷해서 구분하기 힘들었음.
    + 해결: CodingKey를 활용 -> 알아보기 쉽게 이름을 바꿨다.

### Reflection

* 이번 과제에서는 옵셔널 바인딩 대신에 guard문과 guard let문이 많이 활용됐다. guard문의 특성을 살릴 수 있는 부분들이 많았다(로그인뷰컨, 회원가입 뷰컨)

* 자주쓰고 반복되는 코드들은 최대한 extenstion으로 빼려고 했다. APIService의 타입메서드들 대부분 반복되는 코드들인데 줄이지 못했다. 방법 찾아봐야할 듯.

* Rx를 한 군데라도 적용시켜보려고 했는데, 아직 이해가 부족해서 적용하지 못했다. 강의를 좀 더 찾아 듣는 등 보충학습이 필요하다.

* 전반적으로 받아오는 JSON데이터들이 불편했다. 예를 들어 id가 있다면 게시물id, 작성자id, 코멘트id 모두 다른 id들인데 모두 동일하게 그냥 id로 오는 등 다양한 불편한 점이 존재했다.(구조체의 재사용을 위해서 이렇게 다 동일한건가 생각했지만 그건 아닌듯)

* 비슷한 뷰컨트롤러가 많아서 상속을 활용해보고 싶었지만 아직 익숙하지가 않아서 적용해보지는 못했다.

* MVVM패턴을 처음으로 적용시켜본 과제이다. 각 요소들이 무슨 역할을 담당하는지 직접 코드를 쓰면서 구조에 대해 심층적으로 이해할 수 있었다. 그러나 여전히 부족한 부분도 많이 느꼈다. 예를 들어 어떤 로직을 뷰모델 클래스에 넣어놔야할지, 뷰컨트롤러 클래스에 넣어놔야할지 모호하다. 또 Observable을 언제 어떻게 적용해야할지도 아직 헷갈린다. 이것도 보충학습 필요.

* 처음보다 코드로 UI를 짜는게 많이 익숙해졌다. 이번 과제의 UI가 쉬워서일 수도 있지만 예전보다 자신감은 확실히 생긴듯.

*****

## Video Clip

* [iPhone 8](https://youtu.be/SLTc4Il9fKg)
* [iPhone 13 Pro Max](https://youtu.be/TI5Q_ZEGaX4)

## ScreenShot
<div markdown="1">  
    <div align = "center">
    <img src="https://user-images.githubusercontent.com/87598209/156905054-70c74a70-ab19-43b3-a1f1-0fda1ab89855.png" width="250px" height="600px"></img>
    <img src="https://user-images.githubusercontent.com/87598209/156905379-3951d492-1872-4979-a48c-102e2f717b1c.png" width="250px" height="600px"></img>
    <img src="https://user-images.githubusercontent.com/87598209/156905380-19613004-013e-4f9f-9b3d-e06e14f4341f.png" width="250px" height="600px"></img>
</div>
<div markdown="1">  
    <div align = "center">
    <img src="https://user-images.githubusercontent.com/87598209/156905057-749c83a3-bdb3-4917-a2fe-caf833db3741.png" width="250px" height="600px"></img>
    <img src="https://user-images.githubusercontent.com/87598209/156905058-9502d269-acac-44dd-afa6-26c486ac5324.png" width="250px" height="600px"></img>
    <img src="https://user-images.githubusercontent.com/87598209/156905060-30f1e940-2399-49f4-9f0f-f250c90cab1f.png" width="250px" height="600px"></img>
</div>  
