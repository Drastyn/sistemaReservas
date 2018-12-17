#MODELO DESECHADO -> REEMPLAZADO POR USER (CREADO CON DEVISE)

=begin
class Cliente < ApplicationRecord
  has_many :reserva

  validates :nombresCliente,  presence:{ message: "debe ingresar un nombre"}
  validates :nombresCliente, length: { minimum: 2, message: "Debe tener a lo menos 2 letras el nombre." }

  validates :nombresCliente, format: { :with =>/\A+[a-zA-Z\s]+\z/, message: "solo puede contener letras." }


  validates :fechaNacimiento, presence:{ message: "debe ingresar una fecha de nacimiento"}
  validate :fecha_de_nacimiento_debe_ser_en_pasado

  validates :direccionCliente, presence:{ message: "debe ingresar una direccion"},length: { minimum: 3, message: "la direccion es muy corta."}

  validates :emailCliente, presence:{ message: "debe ingresar un mail"},uniqueness: { message: "este mail ya esta en uso."},  format: { with: URI::MailTo::EMAIL_REGEXP , message: "formato no valido (ejemplo@ejemplo.com)"}

  validates :contraseñaCliente, presence:{ message: "debe ingresar una contraseña"},confirmation: true,length: { minimum: 3, message: "la contraseña es muy corta."}

  def fecha_de_nacimiento_debe_ser_en_pasado
    if fecha_nacimiento.present? && fechaNacimiento >= Date.today
      errors.add(:fechaNacimiento, "debe ser anterior a la fecha de hoy")
    end
  end
end
=end
