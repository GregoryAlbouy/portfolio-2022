module Page.Template exposing (view)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)


view : String -> List (Html msg) -> Html msg
view title children =
    div []
        [ h1 [ class "page-title" ] [ text title ]
        , div [ class "page-body" ] children
        ]
