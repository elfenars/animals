class Post < ActiveRecord::Base

	before_validation :set_defaults, on: :create

	belongs_to :user
	attr_accessor :image

	validates :user_id, presence: true

	mount_uploader :image, ImageUploader

	private

	def set_defaults
      self.status = 'Activo'
    end
end
