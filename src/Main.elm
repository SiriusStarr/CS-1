module Main exposing (square, negative)

square x = x * x

negative : number -> Bool
negative n = if n <= 0 then True
    else False