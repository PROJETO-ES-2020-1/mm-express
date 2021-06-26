class CreateSolicitacaoRepasses < ActiveRecord::Migration[6.1]
  def change
    create_table :solicitacao_repasses do |t|
      t.date :dataSolicitada

      t.timestamps
    end
  end
end
