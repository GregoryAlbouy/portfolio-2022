module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, a, div, header, li, main_, nav, text, ul)
import Html.Attributes exposing (class, classList, href)
import PageAbout
import PageNotFound
import PageProjects
import Url exposing (Url)



-- MODEL


type alias Model =
    { key : Nav.Key
    , currentPage : Page
    }


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init () url key =
    ( { key = key, currentPage = parseUrl url }, Cmd.none )


type Page
    = About
    | Projects
    | NotFound



-- UPDATE


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | currentPage = parseUrl url }
            , Cmd.none
            )


parseUrl : Url -> Page
parseUrl url =
    case url.path of
        "/" ->
            About

        "/about" ->
            About

        "/projects" ->
            Projects

        _ ->
            NotFound



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Gregory Albouy"
    , body =
        [ viewMainHeader
        , viewMainNav
        , viewPageContent model.currentPage
        ]
    }



-- VIEW main-header


viewMainHeader : Html Msg
viewMainHeader =
    header [ class "main-header" ]
        [ div [ classList [ ( "main-logo", True ), ( "heading", True ) ] ] [ text "Gregory Albouy" ]
        , div [ classList [ ( "main-sublogo", True ), ( "heading", True ) ] ] [ text "Software Engineer" ]
        ]



-- VIEW main-nav


type alias LinkDefinition =
    { to : String
    , display : String
    }


navLinks : List LinkDefinition
navLinks =
    [ { to = "./about", display = "About" }
    , { to = "./projects", display = "Projects" }
    ]


viewMainNav : Html Msg
viewMainNav =
    let
        toItem : LinkDefinition -> Html msg
        toItem { to, display } =
            li
                [ class "nav-item" ]
                [ a [ href to, class "nav-link" ] [ text display ] ]
    in
    nav
        [ class "main-nav" ]
        [ ul [ class "nav-list" ] (navLinks |> List.map toItem) ]



-- VIEW content


viewPageContent : Page -> Html Msg
viewPageContent currentPage =
    let
        content : Html msg
        content =
            case currentPage of
                About ->
                    PageAbout.view

                Projects ->
                    PageProjects.view

                NotFound ->
                    PageNotFound.view
    in
    main_ [] [ content ]



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = UrlRequested
        , onUrlChange = UrlChanged
        }
