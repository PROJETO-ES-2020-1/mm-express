class CreateMoradores < ActiveRecord::Migration[6.1]
  def change
    create_table :moradores do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :cpf
      t.integer :numero_residencia
      t.integer :bloco

      t.timestamps
    end
  end
end
