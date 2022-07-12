module PageProjects exposing (view)

import Html exposing (Html, div, h1, p, text)


view : Html msg
view =
    div []
        [ h1 [] [ text "Projects" ]
        , p [] [ text "Placeholder for project list" ]
        ]
