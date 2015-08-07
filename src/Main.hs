module Main where

import Options.Applicative ((<$>), (<*>), (<>), Parser, ParserInfo)

import qualified Options.Applicative as O


data Options = Options {
    optInputFiles :: [FilePath],
    optTimeLimit :: Int,
    optMemoryLimit :: Int,
    optPowerPhrases :: [String]}
  deriving (Show)

parseOptions :: Parser Options
parseOptions =
    Options <$>
      O.many (
        O.strOption (
          O.short 'f' <>
          O.metavar "FILENAME" <>
          O.help "Files containing JSON encoded input")) <*>
      O.option O.auto (
        O.short 't' <>
        O.metavar "NUMBER" <>
        O.value 0 <>
        O.help "Time limit, in seconds, to produce output") <*>
      O.option O.auto (
        O.short 'm' <>
        O.metavar "NUMBER" <>
        O.value 0 <>
        O.help "Memory limit, in megabytes, to produce output") <*>
      O.many (
        O.strOption (
          O.short 'p' <>
          O.metavar "STRING" <>
          O.help "Phrases of power, as quoted string"))

withInfo :: Parser a -> String -> ParserInfo a
withInfo parser info =
    O.info (O.helper <*> parser) (O.progDesc info)


main :: IO ()
main = do
    opts <- O.execParser (parseOptions `withInfo` "Solve the problem")
    print opts