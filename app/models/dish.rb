class Dish < ApplicationRecord
  belongs_to :category
  def self.buscador(termino)
    Dish.where("nombre LIKE ?", "%#{termino}%")
  end
end
