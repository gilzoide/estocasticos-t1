import Estocasticos
import Matriz
import GHC.Real

main = do
    line <- getLine
    let adjs = read line :: Adjacencias
    print adjs
    let matriz = map (map (`reduce` 1)) adjs
    print $ ajusteEstocastico matriz
