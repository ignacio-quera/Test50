require 'test_helper'
require 'simplecov'
SimpleCov.start

class PreguntumTest < ActiveSupport::TestCase
  fixtures :preguntas

  test "should save pregunta" do
    pregunta = preguntas(:one)
    assert pregunta.save
  end

  test "should not save pregunta without title" do
    pregunta = preguntas(:two)
    pregunta.title = nil
    assert_not pregunta.save
  end

  test "should have at least one respuesta" do
    pregunta = preguntas(:three)
    assert_not pregunta.respuestas.empty?
  end
end

