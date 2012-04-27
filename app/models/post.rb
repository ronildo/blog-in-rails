class Post < ActiveRecord::Base
	belongs_to :user

	extend FriendlyId
	friendly_id :title, use: :slugged

	validates :title, :presence => true, :uniqueness => true, :length => { :minimum => 5 }
	validates :content, :presence => true, :length => { :minimum => 10 }

	attr_accessible :title, :content, :user_id, :full_content
end