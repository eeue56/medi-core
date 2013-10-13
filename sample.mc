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

data Example = Example {
    text :: String
    time :: Int
}

let newExample = Example "some text" 123

-- Just like netlogo, properties of data can be accessed through "of"
-- this works well with lenses, while being readable and built into the language
let exampleText = text of newExample

-- with also works for a simple way to filter
let examples = [Example a b | a <- ["a".."z"], b <- [1..26]]

let allBExamples = examples with text == "b"
let lessThanTenExamples = examples with time < 10

-- you can also combine these with of

let textOfLessThanTenExamples = text of examples with time < 10

-- Lists and tuples are converted when they are the right size

let myList = ["hello", 5]
let myTuple = ("hello", 5)

let newExample = Example myList
let newExample = Example myTuple

addText myList
addText myTuple

let examples = map Example $ zip ["a".."z"] [1..26]

-- where works as a setter
let firstExample = examples !! 0 where time = 1

-- the same as increaseTime :: Example -> Example
increaseTime on Example
increaseTime x = x where time = 1 + time of x 

-- the same as increaseTime :: Example -> Int -> Int -> Example
increaseTime on Example using Int -> Int
increaseTime x t1 t2 = x where time = t1 - t2