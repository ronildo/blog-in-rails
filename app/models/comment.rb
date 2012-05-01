class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	validates :body, :presence => true, :length => { :minimum => 20 }
	validates :user, :presence => true
	validates :post, :presence => true

	attr_accessible :body, :content, :user_id, :post_id
end
