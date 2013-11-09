class CreateTranslates < ActiveRecord::Migration
  def change
    create_table :translates do |t|
      t.text :message

      t.timestamps
    end
  end
end
