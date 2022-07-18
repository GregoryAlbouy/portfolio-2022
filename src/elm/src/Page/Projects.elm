module Page.Projects exposing (view)

import Html exposing (Html, a, article, div, h3, img, li, p, span, text, ul)
import Html.Attributes exposing (alt, class, href, src)
import Page.Template
import Project exposing (Project)
import Url exposing (Url)


view : List (Html msg)
view =
    Page.Template.view "Projects"
        [ ul [ class "project-list" ] (Project.map (toProjectCard >> inLi "project-item")) ]


inLi : String -> Html msg -> Html msg
inLi className html =
    li [ class className ] [ html ]


toText : String -> Html msg
toText t =
    text t


toProjectCard : Project -> Html msg
toProjectCard { name, desc, tags, repo, demo, image } =
    article [ class "project-card" ]
        [ div [ class "img-container" ]
            [ viewImg { name = name, image = image }
            , viewImgOverlay { demo = demo, repo = repo }
            ]
        , div [ class "content" ]
            [ h3 [ class "name" ] [ text name ]
            , div [ class "slider" ]
                [ p [ class "description" ] [ text desc ]
                , viewTagList tags
                ]
            ]
        ]


viewImg : { name : String, image : Maybe Url } -> Html msg
viewImg { name, image } =
    case image of
        Nothing ->
            span [ class "img-placeholder" ] [ text "No Illustration" ]

        Just url ->
            img [ src (Url.toString url), alt name ] []


viewImgOverlay : { demo : Maybe Url, repo : Maybe Url } -> Html msg
viewImgOverlay { demo, repo } =
    let
        toNode : String -> Maybe Url -> Html msg
        toNode content maybeUrl =
            case maybeUrl of
                Just url ->
                    a [ href (Url.toString url), class "button" ] [ text content ]

                Nothing ->
                    text ""
    in
    div [ class "img-overlay" ]
        [ demo |> toNode "View demo", repo |> toNode "View repo" ]


viewTagList : List String -> Html msg
viewTagList tags =
    ul [ class "tag-list" ] (tags |> List.map (toText >> inLi "tag"))
