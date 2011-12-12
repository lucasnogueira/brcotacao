require 'test/unit'
require 'date'
require 'brcotacao'

class LibraLibanoTest < Test::Unit::TestCase

  def test_cotacao
    cotacao_esperada = {:compra => 0.0012, :venda => 0.001208}
    assert_equal cotacao_esperada, BrCotacao::LibraLibano.new.cotacao(Date.new(2011, 12, 9))
    assert_raise BrCotacao::Errors::CotacaoNaoEncontradaError do
      BrCotacao::LibraLibano.new.cotacao(Date.new(2011, 12, 10))
    end
  end

  def test_compra
    assert_equal 0.0012, BrCotacao::LibraLibano.new.compra(Date.new(2011, 12, 9))
    assert_raise BrCotacao::Errors::CotacaoNaoEncontradaError do
      BrCotacao::LibraLibano.new.compra(Date.new(2011, 12, 10))
    end
  end

  def test_venda
    assert_equal 0.001208, BrCotacao::LibraLibano.new.venda(Date.new(2011, 12, 9))
    assert_raise BrCotacao::Errors::CotacaoNaoEncontradaError do
      BrCotacao::LibraLibano.new.venda(Date.new(2011, 12, 10))
    end
  end

end