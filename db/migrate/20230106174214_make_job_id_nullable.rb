class MakeJobIdNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :line_items, :job_id, true
  end
end
