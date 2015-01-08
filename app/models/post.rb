class Post < ActiveRecord::Base

	attr_accessor :image
	belongs_to :user

	before_validation :set_defaults, on: :create
	validates :title, :state, :contact, :description, presence: true
	validates :image, presence: true if Rails.env.production?

	mount_uploader :image, ImageUploader

	scope :found, 		-> { where(state: 'found') }
	scope :lost,			-> { where(state: 'lost') }
	scope :adoption,	-> { where(state: 'adoption') }

	def active?
		self.status == 'active'
	end

	private

	def set_defaults
      self.status = 'active'
    end
end
