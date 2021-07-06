require "validates_timeliness"

class SolicitacaoRepasse < ApplicationRecord
  has_one :entrega_externa

  validates_date :dataSolicitada, :after => Date.yesterday, after_message: "data invalida"
  validates :entrega_externa_id, presence: true
end
