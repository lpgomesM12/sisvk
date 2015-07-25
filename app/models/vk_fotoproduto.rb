class VkFotoproduto < ActiveRecord::Base
  belongs_to :vk_produto

  #validates :image, :attachment_presence => true
  has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100#" }
  #validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)

end
