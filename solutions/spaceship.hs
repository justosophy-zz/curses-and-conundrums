{-
    <<THIS IS THE SOLUTIONS FILE>>

    Your stumble aboard an ancient spaceship. A pulse flashes and
    you drop your laptop. Your code has been scrambled!
    Your computer was scanned and infected by an ancient algorithm.
    Suddenly, your Haskell code is severely restricted.
    
    You discover the following anomalies:
    1. You can no longer define new data constructors like `True` or `Just a`.
    2. You can no longer specify multiary data types using the `|` symbol.
    3. All your other types are gone: List, Maybe, (), tuples etc.
    4. Except you can still construct strings using literal syntax, `foo = "hello world"`
    4. A "sacred set" of ancient data types appears to be hard coded at the top
        of your file. These are exempt from rules 1. and 2. and cannot be modified.
    
    Find a way to recreate your data types and values (up to isomorphism) using
    what you find below.

    Magic rule 5: All language extensions and other imports are broken.
    No funny business. You get it.
-}

data Unit = Unit
data Identity a = Identity a
data Const c a = Const c
data Sum a a' = Left a | Right 'a
data Product a a' = Product a 'a
data FunctionProduct a a' = FunctionProduct a 'a

-- data Bool = False | True
data Bool = Sum Unit Unit

-- f = False
-- t = True
f = Left Unit
t = Right Unit

-- data Size = Small | Medium | Large | ExtraLarge
data Size = Sum Unit (Sum Unit (Sum Unit (Sum Unit Unit)))

-- small = Small
-- large = Large
small = Left Unit
large = Right (Right (Left Unit))

-- data Maybe a = Nothing | Just a
data Maybe a = Sum (Const Unit a) (Identity a)

-- nothing = Nothing
-- justHello = Just "hello"
nothing = Left (Const Unit)
justHello = Right (Identity "hello")

-- data List a = Nil | Cons a (List a)
data List a = Sum (Const Unit a) (Product (Identity a) (List a))

-- emptyList = []
-- twoItems = [ 1, 2 ]
emptyList = Left (Const Unit)
twoItems =
    Right (
        Product (
            (Identity 1)
            (Right (
                Product (
                    (Identity 2)
                    (Left (Const Unit))
                )
            ))
        )
    )

-- data Tree a = Leaf a | Branch (Tree a) (Tree a)
data Tree a = Sum (Identity a) (Product (Tree a) (Tree a))

-- leaf = Leaf "rain"
-- branch = Branch (Leaf "day") (Leaf "night")
leaf = Left (Identity "rain")
branch = Right (Product (Identity "day") (Identity "night"))

-- data RoseTree a = Node a (List (RoseTree a))
data RoseTree a = Product (Identity a) (List (RoseTree a))

-- singleNode = Node "I am" []
singleNode = Product (Identity "all by myself") (Left (Const Unit))

-- htmlTree =
--         Node "main"
--         [ Node "h1" [ Node "`Title" [] ]
--         , Node "h2" [ Node "`Sub title" [] ]
--         , Node "ul" [ Node "li" [ Node "`a list item" [] ] ]
--         ]
htmlTree = -- yeah, it's a lot of typing..


{-
    A voice whispers in the dark, "equivalent up to isomorphism..."
-}