class Resultado

  attr_accessor "gols_time_a","gols_time_b"
  def initialize(gols_time_a, gols_time_b)
    @gols_time_a = gols_time_a
    @gols_time_b = gols_time_b
  end

  def acertou_gols_time_a(resultado)
    return @gols_time_a == resultado.gols_time_a
  end

  def acertou_gols_time_b(resultado)
    return @gols_time_b == resultado.gols_time_b
  end

  def empate?
    return @gols_time_b == @gols_time_a
  end

  def time_a_ganhou?
    return @gols_time_a > @gols_time_b
  end

  def time_b_ganhou?
    return @gols_time_b > @gols_time_a
  end


  def pontos_obtidos_por_gol(resultado)
    pontos = 0
    if acertou_gols_time_a(resultado)
      pontos += 1
    end
    if acertou_gols_time_b(resultado)
      pontos += 1
    end
    pontos
  end

  def pontos_obtidos_por_resultado(resultado)
    pontos = 0
    if (empate? and resultado.empate?) or
        (time_a_ganhou? and resultado.time_a_ganhou?) or
        (time_b_ganhou? and resultado.time_b_ganhou?)
      pontos += 2
    end
    pontos
  end

  def pontuacao_resultado(resultado_final)
    pontuacao = pontos_obtidos_por_gol(resultado_final)
    pontuacao += pontos_obtidos_por_resultado(resultado_final)
    pontuacao
  end

end

def bolao(apostador1, aposta, placar)
  return [apostador1, 0] if aposta[2] != placar[2]
  [apostador1, 1]
end
