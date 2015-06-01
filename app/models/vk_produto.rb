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
     #self.joins('LEFT JOIN vk_empresavitrines vk on vk_empresa_id = vk.vk_empresa_id').where('(sp.NOME_pessoa) like ? and sp.sivic_igreja_id = ? and sp.data_exclusao is null', "%#{query}%", sivic_igreja_id).order('NOME_pessoa')
    else
     self.all
      #self.joins('LEFT JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sp.sivic_igreja_id = ? and sp.user_exclusao is null',sivic_igreja_id).order('NOME_pessoa')
    end    
  end

  def self.busca_nome_vitrine(nome,vitrine)
    if query
      query = query.downcase
     self.where('lower(nome_produto)like ?',"%#{query}%") 
     #self.joins('LEFT JOIN vk_empresavitrines vk on vk_empresa_id = vk.vk_empresa_id').where('(sp.NOME_pessoa) like ? and sp.sivic_igreja_id = ? and sp.data_exclusao is null', "%#{query}%", sivic_igreja_id).order('NOME_pessoa')
    else
     self.all
      #self.joins('LEFT JOIN sivic_pessoas sp on sivic_pessoa_id = sp.id').where('sp.sivic_igreja_id = ? and sp.user_exclusao is null',sivic_igreja_id).order('NOME_pessoa')
    end  
  end


end
