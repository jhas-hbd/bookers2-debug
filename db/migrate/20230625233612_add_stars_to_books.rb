class AddStarsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :stars, :float
  end
end
