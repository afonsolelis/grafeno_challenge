class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.string :cpf
      t.string :state
      t.integer :value

      t.timestamps
    end
  end
end
