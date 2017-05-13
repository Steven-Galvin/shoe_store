class EditBrandTable < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :price, :integer)
    add_column(:brands, :raw_price, :decimal)
    add_column(:brands, :final_price, :string)
  end
end
