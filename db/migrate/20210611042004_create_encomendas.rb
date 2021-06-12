class CreateEncomendas < ActiveRecord::Migration[6.1]
  def change
    create_table :encomendas do |t|
      t.float :peso
      t.string :remetente
      t.references :morador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
