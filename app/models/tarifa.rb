class Tarifa < ApplicationRecord
  has_many :habitacions

  validates :preciotarifa , numericality: {only_integer: true, message: "ingrese solo numeros"}, presence: {message: "campo en blanco"}
  validate :mayor_cero

  def mayor_cero
    if preciotarifa < 10000
      errors.add(:preciotarifa, "debe ingresar un precio adecuado")
    end
  end
end
