module Main exposing (negative, square)


square : number -> number
square x =
    x * x


negative : number -> Bool
negative n =
    n < 0
