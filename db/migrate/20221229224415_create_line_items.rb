class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.belongs_to :job, null: false, foreign_key: true
      t.belongs_to :invoice, null: true, foreign_key: true
      t.string :description
      t.string :line_item_type
      t.decimal :amount

      t.timestamps
    end
  end
end
