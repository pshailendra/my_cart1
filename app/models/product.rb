class Product < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged


  has_attached_file :image, styles: {:medium => '150x250>', :thumb => '40x65>'}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
