class VkCategoriaproduto < ActiveRecord::Base
	  has_many :children, :class_name => "VkCategoriaproduto", :foreign_key => "father_id"
    belongs_to :father, :class_name => "VkCategoriaproduto", :foreign_key => "father_id"

end
