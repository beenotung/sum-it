module Parser.Core exposing (..)

import Parser.Types exposing (..)


parseArticle : String -> ArticleType
parseArticle s =
    []


parseParagraph : String -> ParagraphType
parseParagraph s =
    []


parseSentence : String -> SentenceType
parseSentence s =
    []


parseWord : String -> WordType
parseWord s =
    s


parseToken : String -> List Token
parseToken s =
    []


parseToken_acc : List Char -> List Char -> List Token -> List Token
parseToken_acc input_cs acc_cs output_acc =
    case input_cs of
        [] ->
            List.reverse output_acc

        c :: input_cs_tail ->
            []


toString : List Token -> String
toString tokens =
    ""
