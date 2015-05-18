-- | Módulo auxiliar pras operações com matrizes e vetores
module Matriz where

import Data.List (transpose)
import GHC.Real (Ratio)

type Valor = Ratio Int
type Vetor = [Valor]
type Matriz = [Vetor]


-- | Produto Escalar x Vetor
(*!) :: Valor -> Vetor -> Vetor
a *! v = map (a *) v
-- otro jeito maneiro de escrever: [ a * x | x <- v ]


-- | Produto Escalar x Matriz
(*!!) :: Valor -> Matriz -> Matriz
a *!! m = map (a *!) m
-- otro jeito maneiro de escrever: [ a *! linha | linha <- m ]


-- | Produto escalar entre Vetores
(!*!) :: Vetor -> Vetor -> Valor
v1 !*! v2 = sum produtos
    where
        produtos = zipWith (*) v1 v2


-- | Produto Matriz x Vetor
(!!*!) :: Matriz -> Vetor -> Vetor
m !!*! v = map (!*! v) m
-- otro jeito maneiro de escrever: [ linha !*! v | linha <- m ]


-- | Produto entre Matrizes
(!!*!!) :: Matriz -> Matriz -> Matriz
m1 !!*!! m2 = map (colunas !!*!) m1
-- otro jeito maneiro de escrever: [ colunas !!*! linha | linha <- m1 ]
    where
        colunas = transpose m2
