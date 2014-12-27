class Post < ActiveRecord::Base

	belongs_to :user
	attr_accessor :image

	mount_uploader :image, ImageUploader
end
