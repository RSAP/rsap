class Post < ApplicationRecord
	belongs_to :user

	validates :titulo, presence: { message: "Titulo em branco" }, length: { in: 5..100, too_short: "Titulo muito curto (deve ser maior que 4 caracteres)",
	too_long: "muito longo (deve ser menor que 100 caracteres)"}
	validates :categoria, presence: { message: "Categoria nao especificada" }
	validates :texto, presence: { message: "Texto em branco" }, length: { minimum: 2, too_short: "muito curto (deve ser maior que 2 caracteres)" }
	validates :user_id, presence: { message: "nao especificado"}

	has_attached_file :imagem, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :imagem, { content_type: /\Aimage\/.*\z/, message: "Imagem invalida" }

	def getImagem
		return self.imagem.url
	end

	def fixarEmGrupo(idGrupo)
		ActiveRecord::Base.connection.exec_query("INSERT INTO posts_de_grupos VALUES (NULL, #{self.id}, #{idGrupo}, '#{Time.now.getutc}', '#{Time.now.getutc}')")
	end

	def getAutor
		ids = ActiveRecord::Base.connection.exec_query("SELECT user_id FROM posts WHERE id=#{self.id}").rows
		return User.find(ids)
	end

end
