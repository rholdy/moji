class AddSourceToMessageModel < ActiveRecord::Migration
  def change
  	add_column :translates, :source, :string
  end
end
