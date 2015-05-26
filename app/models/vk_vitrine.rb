class VkVitrine < ActiveRecord::Base
  belongs_to :vk_cidade

  has_many :children, :class_name => "VkVitrine", :foreign_key => "father_id"
  belongs_to :father, :class_name => "VkVitrine", :foreign_key => "father_id"
  

end
