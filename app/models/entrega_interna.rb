require "validates_timeliness"

class EntregaInterna < ApplicationRecord
  has_one :entrega_externa
  
  validates :data_entrega, presence: true
  validates_date :data_entrega, :before => Date.tomorrow, before_message: "is invalid"

  # uma entrega interna só pode ocorrer entre as 7 da manhã e 6:30 da noite
  validates_time :hora_recebida, :between => "7:00am"..."6:30pm", before_message: "is invalid"

  validates :entrega_externa, presence: true

  validates :recebido_por, presence: true, length: { maximum: 70 }, format: /\A\w+ +\w+\z/
  
end
