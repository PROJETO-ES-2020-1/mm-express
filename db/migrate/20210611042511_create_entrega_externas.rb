class CreateEntregaExternas < ActiveRecord::Migration[6.1]
  def change
    create_table :entrega_externas do |t|
      t.date :dataChegada
      t.time :horaChegada
      t.string :recebidoPor
      t.references :solicitacao_repasse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
