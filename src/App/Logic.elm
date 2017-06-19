module App.Logic exposing (..)

import App.Types exposing (Article, Paragraph, Param, Sentence, Word, WordCounts)
import Dict
import Utils


buildWordCounts : String -> WordCounts
buildWordCounts rawString =
    buildWordCounts_acc Dict.empty


buildWordCounts_acc : WordCounts -> List String
buildWordCounts_acc _ =
    []


stringToWord : WordCounts -> String -> List Word


extractParagraph : String -> List Paragraph


extractSentence : String -> List Sentence


extractWord : String -> List String
extractWord rawString =
    String.split " "
        rawString
        String.toList


extractWord_acc : List String -> List Char -> List Char -> List String
extractWord_acc words acc_cs res_cs =
    case res_cs of
        [] ->
            List.reverse words

        c :: res_cs2 ->
            if Utils.isAlphabet c then
                extractWord_acc (words (c :: acc_cs) res_cs2)
            else
                extractWord_acc ((String.fromList << List.reverse acc_cs) :: words [] res_cs2)


stringToArticle : Param -> String -> Result String Article
stringToArticle param rawString =
    if param.numSentence < 1 then
        "Invalid: the number of sentence should be at least 1."
    else
        {}


articleToString : Article -> String
articleToString =
    .value


processInput : Param -> String
processInput param rawString =
    case stringToArticle rawString of
        Ok article ->
            articleToString article

        Err reason ->
            reason
