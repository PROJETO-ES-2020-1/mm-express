class Encomenda < ApplicationRecord
  belongs_to :usuario
  belongs_to :entrega_externa
end
