module Page.NotFound exposing (view)

import Html exposing (Html, p, text)
import Page.Template


view : List (Html msg)
view =
    Page.Template.view "Not Found"
        [ p [] [ text "The requested page could not be found." ] ]
