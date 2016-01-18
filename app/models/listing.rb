class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	acts_as_taggable # Alias for acts_as_taggable_on :tags
	acts_as_taggable_on :features
	validates_format_of :email, :with => /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/, multiline:true
	validates :title, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :email, presence: true
	mount_uploaders :images, ImageUploader
	searchkick
end
