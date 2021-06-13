class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :cpf
      t.integer :numero_residencia
      t.integer :bloco_residencia
      t.boolean :isMorador, :default => true

      t.timestamps
    end
  end
end
