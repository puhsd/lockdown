class CreateLocks < ActiveRecord::Migration[5.0]
  def change
    create_table :locks do |t|
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
