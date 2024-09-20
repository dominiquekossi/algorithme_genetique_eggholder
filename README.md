# algorithme_genetique_eggholder
# Algoritmo Genético para Minimização da Função Eggholder

Este repositório contém uma implementação de um algoritmo genético para encontrar o valor mínimo da função Eggholder,
uma função conhecida em otimização. O código foi escrito em Octave.

## Tabela de Conteúdos

- [Descrição do Projeto](#descrição-do-projeto)
- [Função Eggholder](#função-eggholder)
- [Estrutura do Código](#estrutura-do-código)
- [Instalação e Execução](#instalação-e-execução)
 

## Descrição do Projeto

O algoritmo genético implementado neste projeto busca minimizar a função Eggholder no intervalo \( x \in [0, 1000] \) e \( y \in [0, 1000] \). A função é representada por um vetor binário de 60 bits, onde os 30 primeiros bits representam \( x \) e os 30 últimos representam \( y \).

## Função Eggholder

A função Eggholder é definida como:

\[ 
f(x, y) = -(y + 47) \sin(\sqrt{x^2 + y + 47}) - x \sin(\sqrt{x - (y + 47)}) 
\]

## Estrutura do Código

O projeto é organizado em vários arquivos de função:

- `algorithme_genetique_eggholder.m`: Função principal que coordena o algoritmo genético.
- `initialiser_population.m`: Inicializa a população de indivíduos.
- `evaluer_population.m`: Avalia a população e calcula o fitness.
- `evoluer_population.m`: Evolui a população através de seleção, cruzamento e mutação.
- `eggholder.m`: Implementa a função Eggholder.
- `decode.m`: Decodifica o vetor binário em valores de \( x \) e \( y \).
- `selection_tournoi.m`: Realiza a seleção por torneio.
- `croisement.m`: Realiza o cruzamento entre os indivíduos.
- `muter.m`: Aplica mutação nos descendentes.
- `afficher_meilleur.m`: Exibe o melhor resultado encontrado.

## Instalação e Execução

### Pré-requisitos

- [GNU Octave](https://www.gnu.org/software/octave/download.html) instalado.

  ## Merci

 
