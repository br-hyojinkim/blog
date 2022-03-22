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
post: `has_many`

- GET /posts/:post_id/comments
- POST /posts/:post_id/comments
- GET /posts/:post_id/comments/:id/edit
- PATCH/PUT /posts/:post_id/comments/:id
- DELETE /posts/:post_id/comments/:id

Tags(태그)
---
post: `has_many` `accepts_nested_attributes_for`

- GET /posts/:post_id/tags
- POST /posts/:post_id/tags
- GET /posts/:post_id/tags/edit
- PATCH/PUT /posts/:post_id/tags/:id
- DELETE /posts/:post_id/tags/:id

Likes(좋아요)
---
post: `has_many`, user: `has_many`

- POST /post/:post_id/like




    