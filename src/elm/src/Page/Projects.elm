module Page.Projects exposing (view)

import Html exposing (Html, p, text)
import Page.Template


view : Html msg
view =
    Page.Template.view "Projects"
        [ p [] [ text "Placeholder for project list" ] ]
