class CreatePhotograms < ActiveRecord::Migration[7.0]
  def change
    create_table :photograms do |t|
      t.string :user
      t.text :comment
      t.string :follow_request
      t.integer :like
      t.string :photo

      t.timestamps
    end
  end
end
