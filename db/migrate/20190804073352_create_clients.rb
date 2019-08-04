class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.text :name
      t.text :phone
      t.text :datestamp
      t.text :barber
      t.text :color

      # добавление 2-х столбцов     created_at and updated_at
      # это дата создания сущности и дата обновления
      t.timestamps
    end
  end
end
