class VkProduto < ActiveRecord::Base
  belongs_to :vk_categoriaproduto
  belongs_to :vk_empresa
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"

  has_many :vk_fotoproduto, :dependent => :destroy
  accepts_nested_attributes_for :vk_fotoproduto, :reject_if => lambda { |t| t['image'].nil? }


  def self.find_by_nome_produto_or_all(query)   
    if query
    	query = query.downcase
     self.where('lower(nome_produto)like ?',"%#{query}%") 
    else
     self.all
    end    
  end

  def self.busca_nome_vitrine(nome,vitrine)
    if nome
      nome = nome.downcase
      self.joins('INNER JOIN vk_empresas ve on ve.id = vk_empresa_id INNER JOIN vk_empresavitrines ev on ve.id = ev.vk_empresa_id ').where('ev.vk_vitrine_id = ? and lower(nome_produto)like ? ',vitrine,"%#{nome}%") 
     else
      self.joins('INNER JOIN vk_empresas ve on ve.id = vk_empresa_id INNER JOIN vk_empresavitrines ev on ve.id = ev.vk_empresa_id ').where('ev.vk_vitrine_id = ?',vitrine) 
    end
  end

  def self.busca_por_vitrine(vitrine)
      self.joins('INNER JOIN vk_empresas ve on ve.id = vk_empresa_id INNER JOIN vk_empresavitrines ev on ve.id = ev.vk_empresa_id ').where('ev.vk_vitrine_id = ?',vitrine)
  end

end
