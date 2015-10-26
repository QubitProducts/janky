class JobEnvironments < ActiveRecord::Migration
  def change
    add_column :builds, :parameters, :text
  end
end
