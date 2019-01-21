class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #campos numericos en la db, asignados con un "alias".
  enum user_role:  [:user , :admin]
  enum estado_habitacion: [:disponible , :reservada]
  enum estado_user: [:activo, :inactivo]
  enum status_habitacion: [:activa, :inactiva]
  enum estado_reserva: [:vigente, :expirada]

  has_attached_file :photo, styles: { medium: "1280x720", thumb: "800x600", mini: "400x200" },:default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
