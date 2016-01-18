class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	validates_format_of :email, :with => /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/, multiline:true
	validates :name, presence: true
	validates :email, presence: true
	validates :contact, presence: true
	validates :startdate, presence: true
	validates :enddate, presence: true
end
