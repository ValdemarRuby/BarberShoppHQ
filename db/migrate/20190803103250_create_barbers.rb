class CreateBarbers < ActiveRecord::Migration[5.2]
  def change
    create_table :barbers do |t|
      t.text :name

      # добавление 2-х столбцов     created_at and updated_at
      # это дата создания сущности и дата обновления
      t.timestamps
    end

    Barber.create :name => 'Jessie Pinkman'
  end
end
