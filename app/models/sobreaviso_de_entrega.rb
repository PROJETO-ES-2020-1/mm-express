require "validates_timeliness"

class SobreavisoDeEntrega < ApplicationRecord
  belongs_to :usuario

  validates_date :data_prevista_entrega, :between => [Date.tomorrow, 3.months.after], before_message: "is invalid"
  enum urgencia_de_repasse: [:Baixa, :Alta]

  validates :usuario, presence: true
  validates :data_prevista_entrega, presence: true
  validates :urgencia_de_repasse, presence: true

  def set_user!(usuario)
    self.usuario_id = usuario.id
  end
end
