class Adddefualtimage < ActiveRecord::Migration[5.1]
  def change
    change_column_default :books, :image, "https://smartmobilestudio.com/wp-content/uploads/2012/06/leather-book-preview.png"
  end
end
