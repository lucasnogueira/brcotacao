require 'test/unit'
require 'date'
require 'brcotacao'

class DolarDosEuaTest < Test::Unit::TestCase

  def test_cotacao
    cotacao_esperada = {:compra => 1.8123, :venda => 1.813}
    assert_equal cotacao_esperada, BrCotacao::DolarDosEua.new.cotacao(Date.new(2011, 12, 9))
    assert_raise BrCotacao::Errors::CotacaoNaoEncontradaError do
      BrCotacao::DolarDosEua.new.cotacao(Date.new(2011, 12, 10))
    end
  end

  def test_compra
    assert_equal 1.8123, BrCotacao::DolarDosEua.new.compra(Date.new(2011, 12, 9))
    assert_raise BrCotacao::Errors::CotacaoNaoEncontradaError do
      BrCotacao::DolarDosEua.new.compra(Date.new(2011, 12, 10))
    end
  end

  def test_venda
    assert_equal 1.813, BrCotacao::DolarDosEua.new.venda(Date.new(2011, 12, 9))
    assert_raise BrCotacao::Errors::CotacaoNaoEncontradaError do
      BrCotacao::DolarDosEua.new.venda(Date.new(2011, 12, 10))
    end
  end

end