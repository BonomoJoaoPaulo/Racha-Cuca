uniforme(amarelo).
uniforme(azul).
uniforme(branco).
uniforme(verde).
uniforme(vermelho).

equipe(catorzebiz).
equipe(fenix).
equipe(peraltas).
equipe(supinos).
equipe(tratores).

capitao(arthur).
capitao(carlos).
capitao(juliano).
capitao(marcio).
capitao(oscar).

strikes(0).
strikes(1).
strikes(2).
strikes(3).
strikes(4).

idade(23).
idade(24).
idade(25).
idade(26).
idade(27).

pontuacao(380).
pontuacao(390).
pontuacao(400).
pontuacao(410).
pontuacao(420).

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
        equipe(Uniforme1, Equipe1, Capitao1, Strikes1, Idade1, Pontuacao1),
        equipe(Uniforme2, Equipe2, Capitao2, Strikes2, Idade2, Pontuacao2),
        equipe(Uniforme3, Equipe3, Capitao3, Strikes3, Idade3, Pontuacao3),
        equipe(Uniforme4, Equipe4, Capitao4, Strikes4, Idade4, Pontuacao4),
        equipe(Uniforme5, Equipe5, Capitao5, Strikes5, Idade5, Pontuacao5)
    ],

    % A aluna de calca branca esta em algum lugar a esquerda da aluna que se matriculou em 2014.
    aEsquerda(aluna(branca, _, _, _, _, _), aluna(_, _, _, 2014, _, _), ListaSolucao),

    % Isabela esta no segundo lugar.
    Nome2 = isabela,

    % Marta e motorista.
    member(aluna(_, marta, _, _, _, motorista), ListaSolucao),

    % A aluna de calca verde esta em algum lugar entre a arquiteta e a mulher de 36 anos, nessa ordem.
    aDireita(aluna(verde, _, _, _, _, _), aluna(_, _, _, _, _, arquiteta), ListaSolucao),
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

    %Testando todas as possibilidades...
    calca(Calca1), calca(Calca2), calca(Calca3), calca(Calca4), calca(Calca5),
    todosDiferentes([Calca1, Calca2, Calca3, Calca4, Calca5]),

    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    todosDiferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),

    posicao(Posicao1), posicao(Posicao2), posicao(Posicao3), posicao(Posicao4), posicao(Posicao5),
    todosDiferentes([Posicao1, Posicao2, Posicao3, Posicao4, Posicao5]),

    matricula(Matricula1), matricula(Matricula2), matricula(Matricula3), matricula(Matricula4), matricula(Matricula5),
    todosDiferentes([Matricula1, Matricula2, Matricula3, Matricula4, Matricula5]),

    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

    profissao(Profissao1), profissao(Profissao2), profissao(Profissao3), profissao(Profissao4), profissao(Profissao5),
    todosDiferentes([Profissao1, Profissao2, Profissao3, Profissao4, Profissao5]).
