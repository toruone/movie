class AddNameBirthplaceToDirecter < ActiveRecord::Migration[6.0]
  def change
    add_column :directors, :name, :string
    add_column :directors, :from, :string

  end
end
