class CreatePregunta < ActiveRecord::Migration[7.0]
  def change
    create_table :pregunta do |t|
      t.text :contenido

      t.timestamps
    end
  end
end
