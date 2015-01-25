class Product < ActiveRecord::Base

  has_attached_file :image, styles: {:medium => '150x250>', :thumb => '40x65>'}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
