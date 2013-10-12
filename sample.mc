addTwo :: Int -> Int -> Int
addTwo x y = x + y

addText :: String -> Int -> (String, Int)
addText x y = (x, y)

-- the order of arguments does not matter when every type is unique
-- helpful for partial application
addText 5 "hello" == addText "hello" 5

let a = addText 5
a "hello"

let b = addText "hello"
b 5