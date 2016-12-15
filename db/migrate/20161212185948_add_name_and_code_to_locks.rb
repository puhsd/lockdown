class AddNameAndCodeToLocks < ActiveRecord::Migration[5.0]
  def change
    add_column :locks, :name, :string
    add_column :locks, :code, :string, unique: true
    add_index :locks, :code
  end
end
