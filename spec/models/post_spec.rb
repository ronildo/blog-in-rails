# encoding: utf-8

require 'spec_helper'

describe Post do
	let (:user) { User.create! :email => "teste@teste.com", :password => "123456" }
	subject { Post.new :title => "Esse é o titulo de primeiro post", :content => "bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla" }

	it 'should have a title' do
		subject.title.should == "Esse é o titulo de primeiro post"
	end

  it 'should genereate slugged based on title' do
  	subject.save
  	subject.slug.should == "esse-e-o-titulo-de-primeiro-post"
  end

  context "when destroying the post" do
  	before do
  		subject.save!
  		@comment = subject.comments.build :body => "Bla bla bla bla blac blac bla blac blac"
  		@comment.user = user
  		@comment.save!
  	end
  	
  	it "should save a comment" do
  		subject.reload
  		subject.comments.size.should == 1
	  end

    it "should destroy all comments" do
    	subject.destroy
    	expect { Comment.find(@comment.id) }.to raise_error ActiveRecord::RecordNotFound
	  end
  end

  context "validations" do
		it { should have_valid(:title).when('Este e um titulo valido', 'Isso também é valido') }
		it { should_not have_valid(:title).when('not', nil, "") }

		it "should be unique" do
			subject.save
			other_title = Post.create :title => "Esse é o titulo de primeiro post", :content => "bla bla bla bla bla bla bla bla bla bal blabasdf sd fdsfafa"
			other_title.should have(1).error_on(:title)
			other_title.errors[:title].should include "has already been taken"
		end
  end
end
