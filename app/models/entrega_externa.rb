class EntregaExterna < ApplicationRecord
  has_one :encomenda

  accepts_nested_attributes_for :encomenda, update_only: true
end
