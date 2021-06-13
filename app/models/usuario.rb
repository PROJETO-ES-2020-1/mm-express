class Usuario < ApplicationRecord
  has_many :encomenda, :dependent => :destroy
end
