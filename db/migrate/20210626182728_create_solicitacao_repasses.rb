class CreateSolicitacaoRepasses < ActiveRecord::Migration[6.1]
  def change
    create_table :solicitacao_repasses do |t|
      t.date :dataSolicitada
      t.references :entrega_externa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
