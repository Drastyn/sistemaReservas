class Cliente < ApplicationRecord
  has_many :reserva

  VALID_RUT_REGEX = /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i
  validates :rutCliente, rut: {message: "rut invalido"}, uniqueness: {message: "rut ya registrado"}, presence: {message:"el campo esta en blanco"}, format: {with: VALID_RUT_REGEX, message: => "formato invalido"}

  VALID_NAME_REGEX = /(?=^.{2,50}$)[a-zA-ZñÑáéíóúÁÉÍÓÚ]+(\s[a-zA-ZñÑáéíóúÁÉÍÓÚ]+)?/
  validates :nombresCliente, length: {in: 2..40, :messagge => "el nombre es demasiado largo"}, format: {with: VALID_NAME_REGEX, :message => "formato no valido"}, prescence: { message: "el campo esta en blanco"}

   VALID_EMAIL_REGEX = /[a-z0-9]+[_a-z0-9.-][a-z0-9]+@[a-z0-9-]+(.[a-z0-9-]+)(.[a-z]{2,4})/
   validates :emailCliente, format: {with: VALID_EMAIL_REGEX, message: "correo invalido"}, confirmation: {case_sensitive: false}, uniqueness: {message: "correo ya registrado"}, length: {in: 7..254, :message => "el correo debe tener entre 7 y 254 caracteres"}, presence: {message: "el campo esta en blanco"}
   validates :nickName, length: {in: 7..20, message: => "su nombre de usuario debe tener de 7 a 20 caracteres"}, uniqueness: {message: "el nombre de usuario ya existe"}, presence: {message: "campo en blanco"}
   validates :contraseñaCliente, length: {in: 7..40, message: => "recomendamos una contraseña mayor a 7 caracteres"}, presence: {message: "el campo esta en blanco"}
   validates :direccionCliente, length: {in: 10..254, :message: => "la dirección debe tener entre 10 y 254 caracteres"}, presence: {message: "el campo esta en blanco"}
end
