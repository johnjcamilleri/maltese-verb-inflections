module VerbCSV where

import Text.Printf
import Data.String.Utils (split)
import Data.List (sort,sortBy)

import qualified System.IO.Strict as StrictIO

-- ---------------------------------------------------------------------------
-- Type and basic functions

type Agr = String
data Inflection = Inflection {
  aspect :: String,
  subject, dir, ind :: Agr,
  pol, tree :: String
} deriving (Show, Read)

showInflectionCSV :: Inflection -> String
showInflectionCSV i = printf "%s,%s,%s,%s,%s,%s" (aspect i) (subject i) (dir i) (ind i) (pol i) (tree i)

-- | This will throw an error if not parseable
readInflectionCSV :: String -> Inflection
readInflectionCSV s =
  Inflection {
    aspect = (bits!!0),
    subject = (bits!!1),
    dir = (bits!!2),
    ind = (bits!!3),
    pol = (bits!!4),
    tree = (bits!!5)
    }
  where
    bits = split "," s

-- | Import file into list of inflections
importFile :: FilePath -> IO [Inflection]
importFile f = do
  s <- StrictIO.readFile f
  let (_:ls) = lines s
  return $ map readInflectionCSV ls
  
-- | While list of inflections to file
exportFile :: FilePath -> [Inflection] -> IO ()
exportFile f is = writeFile f $ unlines (header : map showInflectionCSV is)

-- | Standard header in VerbCSV files
header :: String
header = "Aspect,Subject,DO,IO,Polarity,Surface form"

-- ---------------------------------------------------------------------------
-- Sorting

sortInflections :: [Inflection] -> [Inflection]
sortInflections = sortBy f
  where
    f x y =
      case cmpAspect x y of
        EQ -> case cmpSubject x y of
          EQ -> case cmpObjects x y of
            EQ -> cmpPol x y
            c -> c
          c -> c
        c -> c

cmpAspect :: Inflection -> Inflection -> Ordering
cmpAspect x y = compare (indexOf (aspect x) aspects) (indexOf (aspect y) aspects)
  where aspects = ["Perf","Impf","Imp"]

cmpSubject :: Inflection -> Inflection -> Ordering
cmpSubject x y = compare (indexOf (subject x) pronouns) (indexOf (subject y) pronouns)

cmpObjects :: Inflection -> Inflection -> Ordering
cmpObjects x y = compare (indexOf x' objPronouns) (indexOf y' objPronouns)
  where
    x' = (dir x, ind x)
    y' = (dir y, ind y)
    dashes = repeat "-"
    objPronouns =
      ("-","-") :
      zip pronouns dashes ++
      zip dashes pronouns ++
      [(x,y) | x <- pronouns, y <- pronouns ]
    
-- This is the order in which GF produces them
-- pronouns = [ "P1 Sg","P1 Pl","P2 Sg","P2 Pl","P3 Sg Masc","P3 Sg Fem","P3 Pl" ]

-- This is the natural order
pronouns = [ "P1 Sg","P2 Sg","P3 Sg Masc","P3 Sg Fem","P1 Pl","P2 Pl","P3 Pl" ]

cmpPol :: Inflection -> Inflection -> Ordering
cmpPol x y = case (pol x, pol y) of
  ("Pos", "Neg") -> LT
  ("Neg", "Pos") -> GT
  _ -> EQ

indexOf :: (Eq a) => a -> [a] -> Int
indexOf a [] = 1
indexOf a (x:xs)
  | x == a    = 0
  | otherwise = 1 + indexOf a xs
