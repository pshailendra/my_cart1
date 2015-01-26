class Product < ActiveRecord::Base

  has_many :line_items
  before_destroy :ensure_not_represent_by_any_line_items
  extend FriendlyId
  friendly_id :title, use: :slugged


  has_attached_file :image, styles: {:medium => '150x250>', :thumb => '40x65>'}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def ensure_not_represent_by_any_line_items
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items Presents!..........' )
      return false
    end
  end





end
