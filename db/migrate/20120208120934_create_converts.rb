class CreateConverts < ActiveRecord::Migration
  def change
    create_table :converts do |t|
      t.integer :arabic
      t.string  :word

      t.timestamps
    end
  end
end
