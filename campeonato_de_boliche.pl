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

    % A equipe com 4 strikes está exatamente à esquerda da que tem 380 pontos.
    aEsquerda(equipe(_, _, _, 4, _, _), equipe(_, _, _, _, _, 380), ListaSolucao),

    % Oscar está na equipe que tem 400 pontos.
    member(equipe(_, _, oscar, _, _, 400), ListaSolucao),

    % Na segunda posição está a equipe com 410 pontos.
    Pontuacao2 = 410,

    % O capitão de 26 anos está na equipe que tem 390 pontos.
    member(equipe(_, _, _, _, 26, 390), ListaSolucao),
    
    % Na terceira posição está a equipe do capitão de 25 anos.
    Idade3 = 25,
    
    % Oscar está exatamente à direita da equipe do capitão mais novo.
    aDireita(equipe(_, _, oscar, _, _, _), equipe(_, _, _, _, 23, _), ListaSolucao),
    
    % A equipe Vermelha está em algum lugar entre a equipe do capitão mais velho e a equipe com mais strikes, nessa ordem.
    aDireita(equipe(vermelho, _, _, _, _, _), equipe(_, _, _, _, 27, _), ListaSolucao),
    aEsquerda(equipe(vermelho, _, _, _, _, _), equipe(_, _, _, 4, _, _), ListaSolucao),
    
    % A equipe Fenix está ao lado da equipe que fez 3 strikes.
    aoLado(equipe(_, fenix, _, _, _, _), equipe(_, _, _, 3, _, _), ListaSolucao),
    
    % A equipe que fez 1 strike está ao lado da equipe que tem 400 pontos.
    aoLado(equipe(_, _, _, 1, _, _), equipe(_, _, _, _, _, 400), ListaSolucao),
    
    % A equipe com 390 pontos está exatamente à direita da equipe que fez 3 strikes.
    aDireita(equipe(_, _, _, _, _, 390), equipe(_, _, _, 3, _, _), ListaSolucao),
    
    % Os Peraltas ainda não fizeram strike.
    member(equipe(_, peraltas, _, 0, _, _), ListaSolucao),
    
    % A equipe do Juliano está exatamente à direita da equipe do Oscar.
    aDireita(equipe(_, _, juliano, _, _, _), equipe(_, _, oscar, _, _, _), ListaSolucao),
    
    % Márcio é o capitão da equipe Fenix.
    member(equipe(_, fenix, marcio, _, _, _), ListaSolucao),
    
    % A equipe de Carlos está na quinta posição.
    Capitao5 = carlos,
    
    % Os Tratores estão ao lado da equipe que fez 2 strikes.
    aoLado(equipe(_, tratores, _, _, _, _), equipe(_, _, _, 2, _, _), ListaSolucao),
    
    % A equipe com 1 strike está exatamente à esquerda da equipe 14 Biz.
    aEsquerda(equipe(_, _, _, 1, _, _), equipe(_, catorzebiz, _, _, _, _), ListaSolucao),
    
    % As equipes verde e azul estão lado a lado.
    aoLado(equipe(verde, _, _, _, _, _), equipe(azul, _, _, _, _, _), ListaSolucao),
    
    % O capitão mais novo está na equipe de uniforme Vermelho.
    member(equipe(vermelho, _, _, _, 23, _), ListaSolucao),
    
    % A equipe de Branco está exatamente à esquerda da equipe de Verde.
    aEsquerda(equipe(branco, _, _, _, _, _), equipe(verde, _, _, _, _, _), ListaSolucao),
    
    % A equipe com 390 pontos está exatamente à esquerda da equipe Azul.
    aEsquerda(equipe(_, _, _, _, _, 390), equipe(azul, _, _, _, _, _), ListaSolucao),

    %Testando todas as possibilidades...
    uniforme(Uniforme1), uniforme(Uniforme2), uniforme(Uniforme3), uniforme(Uniforme4), uniforme(Uniforme5),
    todosDiferentes([Uniforme1, Uniforme2, Uniforme3, Uniforme4, Uniforme5]),

    equipe(Equipe1), equipe(Equipe2), equipe(Equipe3), equipe(Equipe4), equipe(Equipe5),
    todosDiferentes([Equipe1, Equipe2, Equipe3, Equipe4, Equipe5]),

    capitao(Capitao1), capitao(Capitao2), capitao(Capitao3), capitao(Capitao4), capitao(Capitao5),
    todosDiferentes([Capitao1, Capitao2, Capitao3, Capitao4, Capitao5]),

    strikes(Strikes1), strikes(Strikes2), strikes(Strikes3), strikes(Strikes4), strikes(Strikes5),
    todosDiferentes([Strikes1, Strikes2, Strikes3, Strikes4, Strikes5]),

    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

    pontuacao(Pontuacao1), pontuacao(Pontuacao2), pontuacao(Pontuacao3), pontuacao(Pontuacao4), pontuacao(Pontuacao5),
    todosDiferentes([Pontuacao1, Pontuacao2, Pontuacao3, Pontuacao4, Pontuacao5]).
