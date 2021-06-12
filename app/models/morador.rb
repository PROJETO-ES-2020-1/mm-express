class Morador < ApplicationRecord
  has_many :encomenda, :dependent => :destroy
end
