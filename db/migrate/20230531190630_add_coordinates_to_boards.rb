class AddCoordinatesToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :latitude, :float
    add_column :boards, :longitude, :float
  end
end
