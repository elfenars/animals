class Post < ActiveRecord::Base

	before_validation :set_defaults, on: :create

	belongs_to :user
	attr_accessor :image

	validates :title, presence: true
	validates :tipo, presence: true
	validates :image, presence: true
	validates :contact, presence: true
	validates :description, presence: true

	mount_uploader :image, ImageUploader

	private

	def set_defaults
      self.status = 'Activo'
    end
end
