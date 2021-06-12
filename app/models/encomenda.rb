class Encomenda < ApplicationRecord
  belongs_to :morador
  belongs_to :entrega_externa
end
