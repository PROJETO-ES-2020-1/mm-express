class CreateEntregaExternas < ActiveRecord::Migration[6.1]
  def change
    create_table :entrega_externas do |t|
      t.date :dataChegada
      t.time :horaChegada
      t.string :recebidoPor

      t.timestamps
    end
  end
end
