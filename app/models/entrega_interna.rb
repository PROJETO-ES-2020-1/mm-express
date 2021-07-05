require "validates_timeliness"

class EntregaInterna < ApplicationRecord
  has_one :entrega_externa

  validates :data_entrega, presence: true
  validates_date :data_entrega, :before => Date.tomorrow, before_message: "is invalid"

  # uma entrega interna só pode ocorrer entre as 7 da manhã e 6:30 da noite
  validates_time :hora_recebida, :between => "7:00am"..."6:30pm", invalid_time_message: "A hora de chegada está inválida. Selecione um horário entre 5:00 e 18:30"
  validates :recebido_por, presence: true, length: { minimum: 3, maximum: 75 }
end
