class Services < ActiveRecord::Base
	require 'carrierwave/orm/activerecord'
	validates :header, presence: true, uniqueness: true
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, uniqueness: true
	validates :url, presence: true, uniqueness: true
	def to_param
    	"#{url}"
  	end
  	mount_uploader :image, ImageUploader
end
