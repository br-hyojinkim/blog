require 'rails_helper'

describe Post do
  before do
    @param = { name: "홍길동", title: "5미만", content: "게시글 내용" }
  end

  after do
    # Do nothing
  end

  context '제목(title) 입력' do
    it '5자리 미만' do
      post = Post.new(@param)
      # puts post.title + " " + post.content
      expect { post.save }.not_to raise_error

      #{ |error|
      #expect(error).to be_a(NameError)
      #}
    end
  end
end


