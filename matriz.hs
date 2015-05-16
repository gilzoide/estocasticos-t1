-- | Módulo auxiliar pras operações com matrizes e vetores
module Matriz where

import Data.List (transpose)

type Valor = Rational
type Vetor = [Valor]
type Matriz = [Vetor]


-- | Produto escalar entre Vetores
(!*!) :: Vetor -> Vetor -> Valor
v1 !*! v2 = sum produtos
    where
        produtos = zipWith (*) v1 v2


-- | Produto Matriz x Vetor
(!!*!) :: Matriz -> Vetor -> Vetor
m !!*! v = map (!*! v) m


-- | Produto entre Matrizes
(!!*!!) :: Matriz -> Matriz -> Matriz
m1 !!*!! m2 = map (colunas !!*!) m1
    where
        colunas = transpose m2


-- | Produto Escalar x Vetor
(*!) :: Valor -> Vetor -> Vetor
a *! v = map (a *) v


-- | Produto Escalar x Matriz
(*!!) :: Valor -> Matriz -> Matriz
a *!! m = map (a *!) m
