class RemoveTimestampsFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_timestamps :products
  end
end
