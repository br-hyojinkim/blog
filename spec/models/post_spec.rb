require 'rails_helper'

describe Post do
  before do
    @post_param = { name: "테스트", title: "신규 게시글입니다", content: "첫 게시글 내용입니다~" }
    @post_param_invalid = { name: "테스트2", title: "5미만", content: "게시글 내용" }
  end

  after do

  end

  context '제목(title) 입력' do
    it '5자리 미만' do
      post = Post.new(@post_param_invalid)

      # puts post.errors[:title].size.to_s
      # puts post.invalid?

      expect(post.save).to eq false     # save 결과 false(실패) 리턴
      expect(post.invalid?).to eq true  # invalid 결과 true 리턴
      expect(post.errors[:title]).to eq ["is too short (minimum is 5 characters)"]  # error 내용
    end
  end

  context '글(Post) 등록' do
    it '정상적인 등록' do
      post = Post.new(@post_param)
      post.save

      # 저장된 게시글
      saved_post = Post.find_by_name("테스트")
      puts saved_post.title
      puts saved_post.content
    end
  end
end


