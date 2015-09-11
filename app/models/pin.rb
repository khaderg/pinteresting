
class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, 
		:styles => { :medium => "300x300>", :thumb => "100x100>" }
		:storage => {:s3} 
    :bucket => '******',
    :s3_credentials => {:access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET']}

 	validates_attachment_content_type :image, :content_type => [ 'image/gif', 'image/png', 'image/x-png', 'image/jpeg', 'image/pjpeg', 'image/jpg' ]

  validates :image, presence: true
  validates :description, presence: true
end
