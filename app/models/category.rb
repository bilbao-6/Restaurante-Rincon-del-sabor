class Category < ApplicationRecord
  has_many :dishes

    def self.buscador(termino)
      Category.where("nombre LIKE ?", "%#{termino}%")
    end

end
