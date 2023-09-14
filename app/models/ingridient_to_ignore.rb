class IngridientToIgnore < ApplicationRecord
  belongs_to :menu_order
  belongs_to :ingridient
end
