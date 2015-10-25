class AddJobEnvironments < ActiveRecord::Migration
  def change
    add_column :repositories, :parameters, :text
  end
end
