class AddPhotoToHabitacions < ActiveRecord::Migration[5.2]
  def change
    add_attachment :habitacions, :photo
  end
end
