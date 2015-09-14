class VkAnuncio < ActiveRecord::Base
  belongs_to :vk_produto
  belongs_to :vk_empresa
  belongs_to :user
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"


  def favorito
      @favorito
  end

  def favorito=(val)
    @favorito = val
  end


  def self.find_by_nome_anuncio_or_all(query)
    if query
      query = query.downcase
     self.where('lower(desc_titulo)like ?',"%#{query}%")

    else
     self.all
    end
  end

 def self.busca_nome_vitrine(nome,vitrine)
    if nome
      nome = nome.downcase
      self.joins('INNER JOIN vk_empresas ve on ve.id = vk_empresa_id INNER JOIN vk_empresavitrines ev on ve.id = ev.vk_empresa_id ').where('ev.vk_vitrine_id = ? and data_inicio < ? and data_fim  >= ? and lower(nome_produto)like ?',vitrine,"%#{nome}%")
     else
      self.joins('INNER JOIN vk_empresas ve on ve.id = vk_empresa_id INNER JOIN vk_empresavitrines ev on ve.id = ev.vk_empresa_id ').where('ev.vk_vitrine_id = ?',vitrine)
    end
 end

 def self.busca_por_vitrine(vitrine)
       data = Time.now
      self.joins('INNER JOIN vk_empresas ve on ve.id = vk_empresa_id INNER JOIN vk_empresavitrines ev on ve.id = ev.vk_empresa_id ').where('ev.vk_vitrine_id = ? and data_inicio <= ? and data_fim  >= ?',vitrine,data,data).paginate(:page => params[:page], :per_page => 10)
  end

  def self.busca_por_empresa(query)
    query = query.downcase
      self.joins('INNER JOIN vk_empresas ve on ve.id = vk_empresa_id').where('lower(ve.nome_pagina) = ?',"#{query}")
  end

end
