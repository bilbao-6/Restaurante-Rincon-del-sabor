class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.integer :precio_total
      t.integer :total
      t.integer :cantidad
      t.integer :cambio
      t.integer :efectivo
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
