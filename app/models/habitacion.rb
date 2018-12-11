class Habitacion < ApplicationRecord
  has_many :reservas

  validates :descripcionHabitacion, length: {in: 7..200, message: "Favor ingrese una descripcion de la habitacion"}, presence: {message: "campo en blanco"}
  validates :tipoHabitacion, length: {in: 7..50, message: "Favor ingrese el tipo de habitacion"}, presence: {message: "campo en blanco"}
  validates :numeroPersonas, numericality: {only_integer: true, message: "Favor ingrese la cantidad de personas que tiene la habitacion"}, presence: {message: "campo en blanco"}
end
