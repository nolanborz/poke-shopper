class RemoveQuanitityFromCartItems < ActiveRecord::Migration[7.2]
  def up
    # Remove the misspelled column
    remove_column :cart_items, :quanitity
  end

  def down
    # Add it back if we need to rollback
    add_column :cart_items, :quanitity, :integer
  end
end
