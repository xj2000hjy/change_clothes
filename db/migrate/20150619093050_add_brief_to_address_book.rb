class AddBriefToAddressBook < ActiveRecord::Migration
  def change
    add_column :address_books, :brief, :string
    add_column :address_books, :string, :string
  end
end
