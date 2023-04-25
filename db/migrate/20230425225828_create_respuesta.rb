class CreateRespuesta < ActiveRecord::Migration[7.0]
  def change
    create_table :respuesta do |t|
      t.text :contenido
      t.references :pregunta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
