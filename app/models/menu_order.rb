class MenuOrder < ApplicationRecord
  belongs_to :menu
  has_many :ingridient_to_ignores
  has_many :excluded_ingridients, through: :ingridients_to_ignore, class_name: 'Ingridient',
                                  foreign_key: 'ingridient_id'
end
