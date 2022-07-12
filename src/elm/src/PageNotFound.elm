module PageNotFound exposing (view)

import Html exposing (Html, div, h1, p, text)


view : Html msg
view =
    div []
        [ h1 [] [ text "Not Found" ]
        , p [] [ text "The requested page could not be found." ]
        ]
