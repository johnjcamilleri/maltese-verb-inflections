-- | Sort an existing CSV file in place
--   Usgae: sort kiteb.csv

import System.Environment
import qualified VerbCSV as V

main :: IO ()
main = do
  args <- getArgs
  case args of
    filename:_ -> do
      is <- V.importFile filename
      V.exportFile filename (V.sortInflections is)
      -- mapM_ putStrLn $ map V.showInflectionCSV (V.sortInflections is)
    _ -> putStrLn $ "Usage: sort kiteb.csv"
