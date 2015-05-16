-- | Módulo de processos estocásticos mesmo: ajustes Estocástico e Ergótico
module Estocasticos where

import Matriz
import GHC.Real

-- | Ajuste estocástico: transforma uma matriz de adjacências em uma matriz
-- estocástica, ou seja, as somas das probabilidades (linhas) iguala a 1
--
-- Nota: é esperado que a matriz contenha somente números 1,
-- como matriz de adjacência
ajusteEstocastico :: Matriz -> Matriz
ajusteEstocastico = map regulaLinha
    where
        -- ajuste estocástico pra linha: se tiver algum 1, distribui `* (1/n)'
        -- entre os tais, senão põe `1/n' pra todo mundo
        regulaLinha l
            | soma /= 0 = map (* (1 % soma)) l
            | otherwise = vetorEstocastico n
            where
                n = length l
                soma = length $ filter (> 0) l


-- | Cria vetor estocástico de tamanho `n', com valores `1/n'
vetorEstocastico :: Int -> Vetor
vetorEstocastico n = replicate n (1 % n)


-- | Cria matriz estocástica de tamanho `n x n', com valores `1/n'
matrizEstocastica :: Int -> Matriz
matrizEstocastica n = replicate n $ vetorEstocastico n
