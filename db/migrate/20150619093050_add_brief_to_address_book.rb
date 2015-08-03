class AddBriefToAddressBook < ActiveRecord::Migration
  def change
    add_column :address_books, :brief, :string  #用户备注
    add_column :address_books, :string, :string #备用字段
  end
end
