class CreateSobreavisoDeEntregas < ActiveRecord::Migration[6.1]
  def change
    create_table :sobreaviso_de_entregas do |t|
      t.date :data_prevista_entrega
      t.integer :urgencia_de_repasse
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
