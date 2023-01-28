class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :accepted
      t.references :Follow, null: false, foreign_key: true

      t.timestamps
    end
  end
end
