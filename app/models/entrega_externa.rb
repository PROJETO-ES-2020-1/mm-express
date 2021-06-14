require "validates_timeliness"

class EntregaExterna < ApplicationRecord
  has_one :encomenda

  accepts_nested_attributes_for :encomenda, update_only: true
  validates :recebidoPor, presence: true, length: { maximum: 70 }, format: /\A\w+ +\w+\z/
  #validates
  validates_date :dataChegada, :before => Date.tomorrow, before_message: "is invalid"
  validates_time :horaChegada, :between => "5:00am"..."7:00pm", before_message: "is invalid"
end
