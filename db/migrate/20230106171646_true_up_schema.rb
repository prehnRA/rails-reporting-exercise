class TrueUpSchema < ActiveRecord::Migration[6.1]
  def change
    rename_table :customers, :businesses
    remove_column :invoices, :job_id

    change_table :invoices do |t|
      t.column :business_id, :bigint, null: false
    end

    change_table :line_items do |t|
      t.column :payment_id, :bigint
      t.column :self_id, :bigint
    end

    create_table :payments do |t|
      t.column :payer_id, :bigint
      t.column :payee_id, :bigint
      t.column :amount, :decimal
      t.column :reference, :string
      t.column :type, :string
      t.column :initiated_at, :datetime
      t.column :completed_at, :datetime
    end
  end
end
