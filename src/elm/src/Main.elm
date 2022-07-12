module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, a, div, header, main_, nav, text)
import Html.Attributes exposing (href)
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
        [ viewHeader
        , viewMain model.currentPage
        ]
    }


viewHeader : Html Msg
viewHeader =
    header []
        [ div [] [ text "Gregory Albouy" ]
        , nav []
            [ a [ href "./about" ] [ text "About" ]
            , a [ href "./projects" ] [ text "Projects" ]
            ]
        ]


viewMain : Page -> Html Msg
viewMain currentPage =
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
