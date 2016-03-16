class AddareasTousers < ActiveRecord::Migration
  def change
    add_column :users, :areas, :string
  end
end
