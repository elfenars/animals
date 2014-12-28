class Post < ActiveRecord::Base

	belongs_to :user
	attr_accessor :image

	validates :user_id, presence: true

	mount_uploader :image, ImageUploader
end
