module PageAbout exposing (view)

import Html exposing (Html, div, h1, p, text)


view : Html msg
view =
    div []
        [ h1 [] [ text "About" ]
        , p [] [ text "Hi! I'm Gregory, a passionnate web developer." ]
        ]
