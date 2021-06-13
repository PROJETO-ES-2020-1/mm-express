require "cpf_cnpj"

class Usuario < ApplicationRecord
  has_many :encomenda, :dependent => :destroy

  validates :nome, presence: true, length: { maximum: 70 }, format: /\w+ \w+/

  VALID_EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, length: { maximum: 260 }, format: { with: VALID_EMAIL_FORMAT }, 
  uniqueness: { case_sensitive: false }

  validates :telefone, presence: true, format: { with: /\A\d+\z/, message: "is invalid" }

  validates :cpf, presence: true, uniqueness: true
  validate :valid_cpf?

  validates :numero_residencia, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 1 }, 
  format: { with: /\A\d+\z/, message: "Only numeric characteres are allowed in this field." }

  validates :bloco_residencia, presence: true , numericality: { only_integer: true, :greater_than_or_equal_to => 1 }, 
  format: { with: /\A\d+\z/, message: "Only numeric characteres are allowed in this field." }
  

  def valid_cpf?
    unless CPF.valid?(self.cpf)
      errors.add(:cpf, "invalid")
    end
  end

end
