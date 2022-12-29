class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
