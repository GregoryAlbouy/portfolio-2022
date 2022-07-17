module Main exposing (Model, Msg, Page, main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, a, div, header, li, main_, nav, text, ul)
import Html.Attributes exposing (class, classList, href)
import Page.About
import Page.NotFound
import Page.Projects
import Url exposing (Url)



-- MODEL


type alias Model =
    { key : Nav.Key
    , currentPage : Maybe Page
    }


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init () url key =
    update (UrlChanged url) { key = key, currentPage = parseUrl url }


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
            let
                page : Maybe Page
                page =
                    parseUrl url
            in
            case page of
                Nothing ->
                    ( model, Nav.pushUrl model.key "/not-found" )

                Just _ ->
                    ( { model | currentPage = page }, Cmd.none )


parseUrl : Url -> Maybe Page
parseUrl url =
    pathToPage url.path


pathToPage : String -> Maybe Page
pathToPage path =
    case path of
        "/" ->
            Just About

        "/about" ->
            Just About

        "/projects" ->
            Just Projects

        "/not-found" ->
            Just NotFound

        _ ->
            Nothing



-- VIEW


view : Model -> Browser.Document Msg
view { currentPage } =
    { title = "Gregory Albouy"
    , body =
        [ viewMainHeader
        , viewMainNav currentPage
        , viewMainContent (currentPage |> Maybe.withDefault NotFound)
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
    [ { to = "/about", display = "About" }
    , { to = "/projects", display = "Projects" }
    ]


viewMainNav : Maybe Page -> Html Msg
viewMainNav currentPage =
    let
        isActive : String -> Bool
        isActive path =
            pathToPage path == currentPage

        toItem : LinkDefinition -> Html msg
        toItem { to, display } =
            li
                [ class "nav-item" ]
                [ a
                    [ href to
                    , classList [ ( "nav-link", True ), ( "active", isActive to ) ]
                    ]
                    [ text display ]
                ]
    in
    nav
        [ class "main-nav" ]
        [ ul [ class "nav-list" ] (navLinks |> List.map toItem) ]



-- VIEW content


viewMainContent : Page -> Html Msg
viewMainContent currentPage =
    let
        content : Html msg
        content =
            case currentPage of
                About ->
                    Page.About.view

                Projects ->
                    Page.Projects.view

                NotFound ->
                    Page.NotFound.view
    in
    main_ [ class "main-content" ] [ content ]



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
