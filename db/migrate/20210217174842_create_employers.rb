class CreateEmployers < ActiveRecord::Migration[6.1]
  def change
    create_table :employers do |t|
      t.string :name
      t.json :mapping, default: {}

      t.timestamps
    end
  end
end
