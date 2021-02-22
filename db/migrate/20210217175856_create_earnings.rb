class CreateEarnings < ActiveRecord::Migration[6.1]
  def change
    create_table :earnings do |t|
      t.string :employee_id
      t.date :earning_date
      t.decimal :amount
      t.references :employer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
