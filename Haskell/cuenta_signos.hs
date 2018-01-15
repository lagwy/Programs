-- Luis Angel Martinez		A00813485
-- Jorge Luis Marquez		A01139543
-- Evert Salinas			A00813642

cuenta_signo :: [Int] -> (Int, Int)
cuenta_signo [] = (0,0)
cuenta_signo (parte : resto)
    | parte < 0 = (1 + (fst aux), snd aux)
    | parte > 0 = (fst aux, 1 + (snd aux))
    | parte == 0 = aux
    where aux = cuenta_signo resto
