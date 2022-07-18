module Page.About exposing (view)

import Html exposing (Html, p, text)
import Page.Template


view : List (Html msg)
view =
    Page.Template.view "About"
        [ p [] [ text "Hi! I'm Gregory, a passionnate web developer." ] ]
