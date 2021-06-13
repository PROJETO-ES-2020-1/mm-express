class Encomenda < ApplicationRecord
  belongs_to :usuario
  belongs_to :entrega_externa

  accepts_nested_attributes_for :entrega_externa, update_only: true
end
