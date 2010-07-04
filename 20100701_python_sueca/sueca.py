valores = {
    'A':11,
    '7':10,
    'K':4,
    'J':3,
    'Q':2,
    '2':0,
    '3':0,
    '4':0,
    '5':0,
    '6':0,
}

class Carta(object):

    def __init__(self, naipe, nome):
        self.naipe = naipe
        self.nome = nome

class Jogada(object):

    def __init__(self, jogador, carta):
        self.jogador = jogador
        self.carta = carta
        self.valor = valores[carta.nome]

    def __gt__(self, jogada):
        return self.valor > jogada.valor

    def trunfo(self, trunfo):
        return self.carta.naipe == trunfo

def pontuacao_mesa(jogadas):
    return sum([jogada.valor for jogada in jogadas])

def fim_rodada(jogadas, trunfo):
    pontos_vencedor = pontuacao_mesa(jogadas)

    jogadas = [jogada for jogada in jogadas if jogada.trunfo(trunfo)] or jogadas

    nome_vencedor = max(jogadas).jogador

    return (nome_vencedor, pontos_vencedor)
