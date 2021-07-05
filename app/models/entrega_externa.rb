require "validates_timeliness"

class EntregaExterna < ApplicationRecord
  has_one :encomenda

  accepts_nested_attributes_for :encomenda, update_only: true

  validates :recebidoPor, presence: true, length: { maximum: 70 }
  validates_date :dataChegada, :before => Date.tomorrow, after_message: "A data de chegada está inválida. Datas futuras não são permitidas"
  validates_time :horaChegada, :between => "5:00am"..."7:00pm", invalid_time_message: "A hora de chegada está inválida. Selecione um horário entre 5:00 e 17:00"

  validates :encomenda, presence: true
end
