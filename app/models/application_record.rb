class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  enum user_role:  [:user , :admin]
  enum estado_habitacion: [:disponible , :ocupada]
end
