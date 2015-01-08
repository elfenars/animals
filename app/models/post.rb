class Post < ActiveRecord::Base

	attr_accessor :image
	belongs_to :user

	before_validation :set_defaults, on: :create
	validates :title, :tipo, :contact, :description, presence: true
	validates :image, presence: true if Rails.env.production?

	mount_uploader :image, ImageUploader

	scope :found, 		-> { where(tipo: 'encontrado') }
	scope :lost,			-> { where(tipo: 'perdido') }
	scope :adoption,	-> { where(tipo: 'adopcion') }

	def active?
		self.status == 'active'
	end

	private

	def set_defaults
      self.status = 'active'
    end
end
