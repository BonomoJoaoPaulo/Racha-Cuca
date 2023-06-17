calca(amarela).
calca(azul).
calca(branca).
calca(verde).
calca(vermelha).

nome(alice).
nome(giovana).
nome(isabela).
nome(marta).
nome(roberta).

posicao(arvore).
posicao(corvo).
posicao(lotus).
posicao(ponte).
posicao(triangulo).

matricula(2012).
matricula(2013).
matricula(2014).
matricula(2015).
matricula(2016).

idade(24).
idade(30).
idade(36).
idade(42).
idade(48).

profissao(arquiteta).
profissao(comerciante).
profissao(manicure).
profissao(motorista).
profissao(psicologa).

%X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).
                       
%X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), 
                        nth0(IndexY,Lista,Y), 
                        IndexX < IndexY.
                        
%X está à direita de Y (em qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista). 

%X está no canto se ele é o primeiro ou o último da lista
noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :- 

    ListaSolucao = [
        aluna(Calca1, Nome1, Posicao1, Matricula1, Idade1, Profissao1),
        aluna(Calca2, Nome2, Posicao2, Matricula2, Idade2, Profissao2),
        aluna(Calca3, Nome3, Posicao3, Matricula3, Idade3, Profissao3),
        aluna(Calca4, Nome4, Posicao4, Matricula4, Idade4, Profissao4),
        aluna(Calca5, Nome5, Posicao5, Matricula5, Idade5, Profissao5)
    ],

    % A aluna de calca branca esta em algum lugar a esquerda da aluna que se matriculou em 2014.
    aEsquerda(aluna(branca, _, _, _, _, _), aluna(_, _, _, 2014, _, _), ListaSolucao),

    % Isabela esta no segundo lugar.
    Nome2 = isabela,

    % Marta e motorista.
    member(aluna(_, marta, _, _, _, motorista), ListaSolucao),

    % A aluna de calca verde esta em algum lugar entre a arquiteta e a mulher de 36 anos, nessa ordem.
    aDireta(aluna(verde, _, _, _, _, _), aluna(_, _, _, _, _, arquiteta), ListaSolucao),
    aEsquerda(aluna(verde, _, _, _, _, _), aluna(_, _, _, _, 36, _), ListaSolucao),

    % No quarto lugar esta a mulher de 30 anos.
    Idade4 = 30,

    % A manicure esta exatamente a esquerda da aluna que gosta de fazer a ponte.
    aEsquerda(aluna(_, _, _, _, _, manicure), aluna(_, _, ponte, _, _, _), ListaSolucao),

    % A aluna de calca azul esta ao lado da aluna de 48 anos.
    aoLado(aluna(azul, _, _, _, _, _), aluna(_, _, _, _, 48, _), ListaSolucao),

    % A psicologa esta em algum lugar entre a aluna matriculada a mais tempo e a comerciante, nessa ordem.
    aDireita(aluna(_, _, _, _, _, psicologa), aluna(_, _, _, 2012, _, _), ListaSolucao),
    aEsquerda(aluna(_, _, _, _, _, psicologa), aluna(_, _, _, _, _, comerciante), ListaSolucao),

    % A motorista esta em algum lugar a direita da aluna de calca branca.
    aDireita(aluna( _, _, _, _, _, motorista), aluna(branca, _, _, _, _, _), ListaSolucao),

    % A aluna que gosta da posicao lotus esta exatamente a esquerda da aluna que gosta da posicao triangulo.
    aEsquerda(aluna(_, _, lotus, _, _, _), aluna(_, _, triangulo, _, _, _), ListaSolucao),

    % A mulher que se matriculou em 2013 esta no quarto lugar.
    Matricula4 = 2013,
    
    % A aluna de calca amarela esta em algum lugar entre a aluna matriculada mais recentemente e a aluna de calca branca, nessa ordem.
    aDireita(aluna(amarela, _, _, _, _, _), aluna(_, _, _, 2016, _, _), ListaSolucao),
    aEsquerda(aluna(amarela, _, _, _, _, _), aluna(branca, _, _, _, _, _), ListaSolucao),

    % A mulher de 42 anos gosta da posicao lotus.
    member(aluna(_, _, lotus, _, 42, _), ListaSolucao),
    
    % Alice esta em algum lugar a direita da aluna de calca verde.
    aDireita(aluna(_, alice, _, _, _, _), aluna(verde, _, _, _, _, _), ListaSolucao),

    % A aluna que gosta da posição Corvo está no primeiro lugar.
    Posicao1 = corvo,
    
    % As mulheres de 42 e 48 anos estão lado a lado.
    aoLado(aluna(_, _, _, _, 42, _), aluna(_, _, _, _, 48, _), ListaSolucao),
    
    % Quem se matriculou em 2016 está em algum lugar entre quem se matriculou em 2012 e quem se matriculou em 2015, nessa ordem.
    aDireita(aluna(_, _, _, 2016, _, _), aluna(_, _, _, 2012, _, _), ListaSolucao),
    aEsquerda(aluna(_, _, _, 2016, _, _), aluna(_, _, _, 2015, _, _), ListaSolucao),

    % A aluna que gosta da posição Árvore está em algum lugar à esquerda da aluna de calça Branca.
    aEsquerda(aluna(_, _, arvore, _, _, _), aluna(branca, _, _, _, _, _), ListaSolucao),

    % Giovana está ao lado da Comerciante.
    aoLado(aluna(_, giovana, _, _, _, _), aluna(_, _, _, _, _, comerciante), ListaSolucao),

    %Testa todas as possibilidades...
    nacionalidade(Nacionalidade1), nacionalidade(Nacionalidade2), nacionalidade(Nacionalidade3), nacionalidade(Nacionalidade4), nacionalidade(Nacionalidade5),
    todosDiferentes([Nacionalidade1, Nacionalidade2, Nacionalidade3, Nacionalidade4, Nacionalidade5]),
    
    saida(Saida1), saida(Saida2), saida(Saida3), saida(Saida4), saida(Saida5),
    todosDiferentes([Saida1, Saida2, Saida3, Saida4, Saida5]),
    
    carregamento(Carregamento1), carregamento(Carregamento2), carregamento(Carregamento3), carregamento(Carregamento4), carregamento(Carregamento5),
    todosDiferentes([Carregamento1, Carregamento2, Carregamento3, Carregamento4, Carregamento5]),
    
    chamine(Chamine1), chamine(Chamine2), chamine(Chamine3), chamine(Chamine4), chamine(Chamine5),
    todosDiferentes([Chamine1, Chamine2, Chamine3, Chamine4, Chamine5]),
    
    destino(Destino1), destino(Destino2), destino(Destino3), destino(Destino4), destino(Destino5),
    todosDiferentes([Destino1, Destino2, Destino3, Destino4, Destino5]).
