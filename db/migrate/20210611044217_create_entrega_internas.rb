class CreateEntregaInternas < ActiveRecord::Migration[6.1]
  def change
    create_table :entrega_internas do |t|
      t.date :data_entrega
      t.time :hora_recebida
      t.string :recebido_por

      t.timestamps
    end
  end
end
