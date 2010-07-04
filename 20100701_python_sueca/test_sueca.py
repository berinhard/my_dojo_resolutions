import unittest
from sueca import Carta, Jogada
from sueca import fim_rodada

class TestGanhadorDaRodada(unittest.TestCase):

    def test_jogador_1_ganha_com_A_copas_trunfo_Espadas(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', 'A')),
            Jogada('Bob', Carta('Copas', '3')),
            Jogada('Charlie', Carta('Copas', '4')),
            Jogada('Debora', Carta('Copas', '5')),
        ]
        trunfo = "Espadas"
        self.assertEquals(fim_rodada(jogadas, trunfo), ('Alice', 11))

    def test_jogador_2_ganha_com_A_copas_trunfo_Espadas(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', '3')),
            Jogada('Bob', Carta('Copas', 'A')),
            Jogada('Charlie', Carta('Copas', '4')),
            Jogada('Debora', Carta('Copas', '5')),
        ]
        trunfo = "Espadas"
        self.assertEquals(fim_rodada(jogadas, trunfo), ('Bob', 11))

    def test_jogador_1_ganha_com_trunfo(self):
        jogadas = [
            Jogada('Alice', Carta('Espadas', '3')),
            Jogada('Bob', Carta('Copas', 'A')),
            Jogada('Charlie', Carta('Copas', '4')),
            Jogada('Debora', Carta('Copas', '5')),
        ]
        trunfo = "Espadas"
        self.assertEquals(fim_rodada(jogadas, trunfo), ('Alice', 11))

    def test_jogador_2_ganha_com_trunfo_maior(self):
        jogadas = [
            Jogada('Alice', Carta('Espadas', 'K')),
            Jogada('Bob', Carta('Espadas', 'A')),
            Jogada('Charlie', Carta('Copas', '4')),
            Jogada('Debora', Carta('Copas', '5')),
        ]
        trunfo = "Espadas"
        self.assertEquals(fim_rodada(jogadas, trunfo), ('Bob', 15))

    def test_jogador_3_ganha_empate_com_A(self):
        jogadas = [
            Jogada('Alice', Carta('Copas', '3')),
            Jogada('Bob', Carta('Copas', '5')),
            Jogada('Charlie', Carta('Copas', 'A')),
            Jogada('Debora', Carta('Ouro', 'A')),
        ]
        trunfo = "Espadas"
        self.assertEquals(fim_rodada(jogadas, trunfo), ('Charlie', 22))

if __name__ == '__main__':
    unittest.main()
