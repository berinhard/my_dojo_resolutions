def avalia_jogo(jogo):
    vencedor_linha = avalia_linhas(jogo)
    vencedor_coluna = avalia_colunas(jogo)
    vencedor_diagonal = avalia_diagonais(jogo)
    return vencedor_linha or vencedor_coluna or vencedor_diagonal or 'velha'

def avalia_linhas(jogo):
    for linha in jogo:
        if not linha[0]:
            continue
        if linha[0] == linha[1] == linha[2]:
            return linha[0]

def avalia_colunas(jogo):
    for coluna in range(3):
        if not jogo[0][coluna]:
            continue
        if jogo[0][coluna] == jogo[1][coluna] == jogo[2][coluna]:
            return jogo[0][coluna]

def avalia_diagonais(jogo):
    if jogo[0][0] == jogo [1][1] == jogo[2][2]:
        return jogo[0][0]
    if jogo[0][2] == jogo [1][1] == jogo[2][0]:
        return jogo[0][2]
