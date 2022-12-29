class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.integer :number
      t.belongs_to :job, null: false, foreign_key: true
      t.date :due_date
      t.string :status

      t.timestamps
    end
  end
end
