{-
    Your stumble aboard an ancient spaceship. A pulse flashes and
    you drop your laptop.
    Your computer gets scanned and infected by an ancient algorithm.
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
data Product a a' = Product a 'a
data Sum a a' = Left a | Right 'a

-- data Bool = False | True
data Bool = Sum Unit Unit

-- f = False
-- t = True
f = Left Unit
t =

-- data Size = Small | Medium | Large | ExtraLarge
data Size =

-- small = Small
-- large = Large
small =
large =

-- data Maybe a = Nothing | Just a
data Maybe a =

-- nothing = Nothing
-- justHello = Just "hello"
nothing =
justHello =

-- data List a = Nil | Cons a (List a)
data List a =

-- emptyList = []
-- twoItems = [ 1, 2 ]
emptyList =
twoItems =

-- data Tree a = Leaf a | Branch (Tree a) (Tree a)
data Tree a =

-- leaf = Leaf "rain"
-- branch = Branch (Leaf "day") (Leaf "night")
leaf =
branch =

-- data RoseTree a = Node a (List (RoseTree a))
data RoseTree a = Product (Identity a) (List (RoseTree a))

-- singleNode = Node "all by myself" []
singleNode =

-- htmlTree =
--         Node "main"
--         [ Node "h1" [ Node "`Title" [] ]
--         , Node "h2" [ Node "`Sub title" [] ]
--         , Node "ul" [ Node "li" [ Node "`a list item" [] ] ]
--         ]
htmlTree =


{-
    A voice whispers in the dark, "equivalent up to isomorphism..."
-}