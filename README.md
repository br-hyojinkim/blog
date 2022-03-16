# blog
Ruby on Rails Guides

**Description**

Ruby & Rails 학습을 위해 [Ruby on Rails 시작하기](https://rubykr.github.io/rails_guides/getting_started.html) 보고 간단한 튜토리얼 프로젝트 생성

**Environment**
- ruby 2.2.5p319 (2016-04-26 revision 54774)
- Rails 4.1.12

**Prerequisite**
1. `bundle install`
2. `rake db:migrate`

Domain 
===
Post(게시글)
---
- GET /posts 
- GET /posts/:id
- GET /posts/new
- POST /posts
- GET /posts/:id/edit
- PATCH/PUT /posts/:id
- DELETE /posts/:id

Comment(댓글)
---
`has_many`

- GET /posts/:post_id/comments
- POST /posts/:post_id/comments
- GET /posts/:post_id/comments/:id/edit
- PATCH/PUT /posts/:post_id/comments/:id
- DELETE /posts/:post_id/comments/:id

Tags(태그)
---
`has_many` `accepts_nested_attributes_for`

- GET /posts/:post_id/tags
- POST /posts/:post_id/tags
- GET /posts/:post_id/tags/edit
- PATCH/PUT /posts/:post_id/tags/:id
- DELETE /posts/:post_id/tags/:id


---


Ruby & Rails 특징
---
### 1. DB 스키마 관리
> rake db:migrate 
    
    Spring 기본 환경과 달리, rails 에서 스키마 변경에 따른 이력 관리가 된다는 점이 신선했다.
    또, 기본적으로 ORM 처리방식이 최근 myBatis 를 줄곧 사용하던 나에겐 익숙하지 않지만 `has_many` `belongs_to` 등 객체-관계 모델을 사용하는 점이 좋았습니다.
    하지만 Model 이 많아질 경우, 어느 ORM 과 마찬가지로 관계 설정에 있어 어려움이 있을거 같아요. 
    DB Entity 표현하는 Class, Query 실행을 담당하는 Repository Class 가 나뉘어져있지 않다는 점에서 코드 리딩에 복잡도가 높아질 것 같아요.

   
### 2. 추상화된 자동화
> rails generate scaffold Post name:string title:string content:text

    발판(Scaffolding)을 이용해서 빠르게 개발할 수 있는점이 신세계였습니다. 프로젝트 설정 & 간단한 api 개발에도 한땀한땀 작성해나가야 하는 Spring 과 너무 달랐네요. (다시 돌아갈 수 있을까 걱정이 잠깐 되기도 했습니다) 
    그리고 레일즈가 자동으로 만들어주는 HTTP 메소드 형식 & 규약이 표준을 따르고 있어서 감사(?)했었습니다.
    하지만 자동으로 생성해주어 편리한 반면에 기능을 최종적으로 완성하는 과정에서 신기한 방황과 삽질을 해볼 수 있었습니다. 


ActiveRecord `accepts_nested_attributes_for :tags` 매크로를 이용하고, 
post_params 에서 `tags_attributes: [:_destroy, :id, :name]` 이용하여 파라메터를 전달하고 있는데 `tags_attributes` 변수명이 어떻게 만들어졌는지는 알기 어렵다.

- post.rb (ActiveRecord) `has_many` `accepts_nested_attributes_for` 관계 설정
 ```
has_many :tags, :dependent => :destroy

accepts_nested_attributes_for :tags, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
 ```

- posts_controller.rb permit params 세팅
```
def post_params
  params.require(:post).permit(:name, :title, :content, tags_attributes: [:_destroy, :id, :name])
end
```

### 3. routes.rb endpoint 모호함

    Spring 에서는 각 api Controller 에서 endpoint 명시해 직관적으로 알아볼 수 있는 반면에 Rails에서는 routes.rb 파일에 API endpoint 들을 모아두고 있습니다.
    api 많아지는 시점에서 일일이 연결되고 관계(?)가 맺어지는 복잡도 또한 트래킹이 어려울것 같은 느낌?



    