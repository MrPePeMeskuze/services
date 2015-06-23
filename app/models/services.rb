class Services < ActiveRecord::Base
	validates :header, presence: true, uniqueness: true
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, uniqueness: true
	validates :url, presence: true, uniqueness: true
	def to_param
    	"#{url}"
  	end
  	has_attached_file :image, :styles => { :medium => "1200x800>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
