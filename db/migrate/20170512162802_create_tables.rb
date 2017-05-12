class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:brands) do |t|
      t.column(:name, :string)
      t.column(:price, :integer)

      t.timestamps
    end

    create_join_table(:brands, :stores) do |t|
      t.timestamps
    end
  end
end
