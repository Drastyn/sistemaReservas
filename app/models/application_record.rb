class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  enum user_role:  [:user , :admin]
end
