class Encomenda < ApplicationRecord
  belongs_to :usuario
  belongs_to :entrega_externa

  validates :peso, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :remetente, presence: true, length: { minimum: 3, maximum: 75 }

  validates :entrega_externa, presence: true
  validates :usuario, presence: true
end
