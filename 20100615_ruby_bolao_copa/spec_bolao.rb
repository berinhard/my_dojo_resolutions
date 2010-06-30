require 'rubygems'
require 'spec'
require 'bolao'

describe 'O resultado de uma aposta' do

  it 'deve retornar 0 pontos quando empate e time A ganha' do
    aposta = Resultado.new(0, 0)
    resultado_final = Resultado.new(2, 1)
    aposta.pontuacao_resultado(resultado_final).should == 0
  end

  it 'deve retornar 0 pontos quando empate e time B ganha' do
    aposta = Resultado.new(0, 0)
    resultado_final = Resultado.new(2, 3)
    aposta.pontuacao_resultado(resultado_final).should == 0
  end

  it 'deve retornar 0 pontos quando aposta time A e time B ganha' do
    aposta = Resultado.new(1, 0)
    resultado_final = Resultado.new(2, 3)
    aposta.pontuacao_resultado(resultado_final).should == 0
  end

  it 'deve retornar 0 pontos quando aposta time A e resulta em empate' do
    aposta = Resultado.new(1, 0)
    resultado_final = Resultado.new(2, 2)
    aposta.pontuacao_resultado(resultado_final).should == 0
  end

  it 'deve retornar 0 pontos quando aposta time B e time A ganha' do
    aposta = Resultado.new(0, 1)
    resultado_final = Resultado.new(3, 2)
    aposta.pontuacao_resultado(resultado_final).should == 0
  end

  it 'deve retornar 0 pontos quando aposta time B e resulta em empate' do
    aposta = Resultado.new(0, 1)
    resultado_final = Resultado.new(2, 2)
    aposta.pontuacao_resultado(resultado_final).should == 0
  end

  it 'deve retornar 1 ponto quando acerta gols do time B' do
    aposta = Resultado.new(0, 1)
    resultado_final = Resultado.new(2, 1)
    aposta.pontuacao_resultado(resultado_final).should == 1
  end

  it 'deve retornar 1 ponto quando acerta gols do time A' do
    aposta = Resultado.new(2, 0)
    resultado_final = Resultado.new(2, 3)
    aposta.pontuacao_resultado(resultado_final).should == 1
  end

  it 'deve retornar 2 ponto quando acerta empate' do
    aposta = Resultado.new(0, 0)
    resultado_final = Resultado.new(1, 1)
    aposta.pontuacao_resultado(resultado_final).should == 2
  end

  it 'deve retornar 2 ponto quando acerta time A ganha' do
    aposta = Resultado.new(1, 0)
    resultado_final = Resultado.new(2, 1)
    aposta.pontuacao_resultado(resultado_final).should == 2
  end

  it 'deve retornar 2 ponto quando acerta time B ganha' do
    aposta = Resultado.new(0, 1)
    resultado_final = Resultado.new(3, 4)
    aposta.pontuacao_resultado(resultado_final).should == 2
  end

  it 'deve retornar 3 ponto quando acerta time B ganha e acerta placar do time A' do
    aposta = Resultado.new(3, 5)
    resultado_final = Resultado.new(3, 4)
    aposta.pontuacao_resultado(resultado_final).should == 3
  end

  it 'deve retornar 3 ponto quando acerta time A ganha e acerta placar do time B' do
    aposta = Resultado.new(2, 0)
    resultado_final = Resultado.new(3, 0)
    aposta.pontuacao_resultado(resultado_final).should == 3
  end

  it 'deve retornar 4 ponto quando acerta time A ganha e acerta os placares' do
    aposta = Resultado.new(2, 0)
    resultado_final = Resultado.new(2, 0)
    aposta.pontuacao_resultado(resultado_final).should == 4
  end

  it 'deve retornar 4 ponto quando acerta time B ganha e acerta os placares' do
    aposta = Resultado.new(0, 1)
    resultado_final = Resultado.new(0, 1)
    aposta.pontuacao_resultado(resultado_final).should == 4
  end

  it 'deve retornar 4 ponto quando acerta empate e os placares' do
    aposta = Resultado.new(1, 1)
    resultado_final = Resultado.new(1, 1)
    aposta.pontuacao_resultado(resultado_final).should == 4
  end
end
