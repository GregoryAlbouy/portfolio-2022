module Project exposing (Project, map)

import Url


type alias Project =
    { slug : String
    , name : String
    , desc : String
    , tags : List String
    , date : Int
    , repo : Maybe Url.Url
    , demo : Maybe Url.Url
    , image : Maybe Url.Url
    }


all : List Project
all =
    [ { name = "Codemon"
      , slug = "codemon"
      , desc = "Creative experience in JS & Sass (no images!) in which you end up fighting a bug in a Pokemon-like 3D battle. Also inspired by macOS interface."
      , tags =
            [ "OOP"
            , "ES6 modules"
            , "Sass"
            , "3D CSS"
            , "Game"
            ]
      , image = "https://gregoryalbouy.com/media/images/projects/codemon.jpg" |> Url.fromString
      , repo = "https://github.com/gregoryalbouy/codemon" |> Url.fromString
      , demo = "https://gregoryalbouy.com/demo/codemon" |> Url.fromString
      , date = 1598447273
      }
    , { name = "Portfolio 2020"
      , slug = "portfolio-2020"
      , desc = "My portfolio, built from scratch using my own Webcomponents framework and EBuilder library!"
      , tags =
            [ "Web components"
            , "TypeScript"
            , "Sass"
            , "Webpack"
            , "Fetch API"
            , "Responsive"
            ]
      , image = "https://gregoryalbouy.com/media/images/projects/gregoryalbouy-front-wcf.jpg" |> Url.fromString
      , repo = "https://github.com/gregoryalbouy/portfolio-wcf-2020" |> Url.fromString
      , demo = Nothing
      , date = 1598447406
      }
    , { name = "Portfolio API (Go+SQL)"
      , slug = "portfolio-api-go"
      , desc = "Backend for my portfolio written in Go language and SQL. Deployed on Google App Engine."
      , tags =
            [ "Go"
            , "SQL"
            , "GCloud"
            , "Back-end"
            , "REST API"
            ]
      , repo = "https://github.com/gregoryalbouy/portfolio-server-go" |> Url.fromString
      , demo = Nothing
      , image = Nothing
      , date = 1598447978
      }
    ]


map : (Project -> a) -> List a
map f =
    List.map f all



{-
   [
     {
       "id": 13,
       "name": "Portfolio API (Go+SQL)",
       "slug": "portfolio-api-go",
       "description": "Backend for my portfolio written in Go language and SQL. Deployed on Google App Engine.",
       "tags": [
         "Go",
         "SQL",
         "GCloud",
         "Back-end",
         "REST API"
       ],
       "repo": "https://github.com/gregoryalbouy/portfolio-server-go",
       "is_hidden": false,
       "added_on": 1598447978
     },
     {
       "id": 12,
       "name": "Portfolio API (Node.js+MongoDB)",
       "slug": "portfolio-2020-api",
       "description": "Portfolio API for project data and message handling. Deployed on Google App Engine.",
       "tags": [
         "Node.js",
         "MongoDB",
         "GCloud",
         "Back-end",
         "REST API"
       ],
       "is_hidden": false,
       "added_on": 1598447722
     },
     {
       "id": 11,
       "name": "Portfolio 2020",
       "slug": "portfolio-2020",
       "description": "My portfolio, built from scratch using my own Webcomponents framework and EBuilder library!",
       "tags": [
         "Web components",
         "TypeScript",
         "Sass",
         "Webpack",
         "Fetch API",
         "Responsive"
       ],
       "image": "https://gregoryalbouy.com/media/images/projects/gregoryalbouy-front-wcf.jpg",
       "repo": "https://github.com/gregoryalbouy/portfolio-wcf-2020",
       "is_hidden": false,
       "added_on": 1598447406,
       "edited_on": 1598447472
     },
     {
       "id": 10,
       "name": "Codemon",
       "slug": "codemon",
       "description": "Creative experience in JS & Sass (no images!) in which you end up fighting a bug in a Pokemon-like 3D battle. Also inspired by macOS interface.",
       "tags": [
         "OOP",
         "ES6 modules",
         "Sass",
         "3D CSS",
         "Game"
       ],
       "image": "https://gregoryalbouy.com/media/images/projects/codemon.jpg",
       "repo": "https://github.com/gregoryalbouy/codemon",
       "demo": "https://gregoryalbouy.com/demo/codemon",
       "is_hidden": false,
       "added_on": 1598447273
     },
     {
       "id": 9,
       "name": "React-dex",
       "slug": "react-dex",
       "description": "Pokedex made in React fetching the PokeAPI. An occasion to practise forms handling with many filter combinations.\"",
       "tags": [
         "React",
         "Fetch API",
         "Sass"
       ],
       "image": "https://gregoryalbouy.com/media/images/projects/react-dex.jpg",
       "repo": "https://github.com/gregoryalbouy/react-dex",
       "demo": "https://gregoryalbouy.github.io/react-dex/build/",
       "is_hidden": false,
       "added_on": 1598447195
     },
     {
       "id": 8,
       "name": "Troc des trains",
       "slug": "troc-des-trains",
       "description": "UX-UI research, mock-ups from scratch, and front demo of a responsive product page for a train tickets e-commerce.",
       "tags": [
         "Web components",
         "Fetch API",
         "Sass",
         "Responsive"
       ],
       "image": "https://gregoryalbouy.com/media/images/projects/trocdestrains.jpg",
       "repo": "https://github.com/gregoryalbouy/troc-des-trains",
       "demo": "https://gregoryalbouy.github.io/troc-des-trains/public/",
       "is_hidden": false,
       "added_on": 1598447119
     },
     {
       "id": 7,
       "name": "Webcomponents Framework",
       "slug": "webcomponents-framework",
       "description": "Architecture & logics template for component-oriented webapps using Custom Elements with separate template files and no configuration.",
       "tags": [
         "Web components",
         "TypeScript",
         "Sass",
         "Webpack",
         "Developer tool"
       ],
       "image": "https://gregoryalbouy.com/media/images/projects/webcomponents-framework.jpg",
       "repo": "https://github.com/gregoryalbouy/webcomponents-framework",
       "is_hidden": false,
       "added_on": 1598446923,
       "edited_on": 1598447018
     },
     {
       "id": 6,
       "name": "Webcomponents boilerplate",
       "slug": "webcomponents-boilerplate",
       "description": "Lightweight vanilla JavaScript solution for ready-to-use Web components with separate HTML and style files.",
       "tags": [
         "Web components",
         "ES6 modules",
         "Fetch API",
         "Sass",
         "Developer tool"
       ],
       "image": "https://gregoryalbouy.com/media/images/projects/webcomponents-boilerplate.jpg",
       "repo": "https://github.com/gregoryalbouy/webcomponents-boilerplate",
       "is_hidden": false,
       "added_on": 1598446774,
       "edited_on": 1598448953
     },
     {
       "id": 5,
       "name": "Ebuilder-js",
       "slug": "ebuilder-js",
       "description": "Lightweight library published on npm allowing to build and manipulate elements in a single statement, with a functionnal touch.",
       "tags": [
         "TypeScript",
         "Webpack",
         "NPM package",
         "Developer tool"
       ],
       "repo": "https://github.com/gregoryalbouy/ebuilder",
       "is_hidden": false,
       "added_on": 1598446695
     },
     {
       "id": 4,
       "name": "GridChecker",
       "slug": "grid-checker",
       "description": "Highly configurable Custom Element <grid-checker> that allows to check visually if an integration is conform to the designer's grid.",
       "tags": [
         "Web Components",
         "TypeScript",
         "Webpack",
         "Developer tool"
       ],
       "image": "https://gregoryalbouy.com/media/images/projects/gridchecker.jpg",
       "repo": "https://github.com/gregoryalbouy/gridchecker",
       "is_hidden": false,
       "added_on": 1598446614
     },
     {
       "id": 3,
       "name": "Virtual Gameboy",
       "slug": "virtual-gameboy",
       "description": "2 hours exam. A simple Gameboy COLOR like the one I got 20 years ago (and still have!). No game in it, sorry!",
       "tags": [
         "Sass",
         "3D CSS"
       ],
       "image": "https://gregoryalbouy.com/media/images/projects/gameboycolor.jpg",
       "demo": "https://gregoryalbouy.com/demo/gameboy-color",
       "is_hidden": false,
       "added_on": 1598446531
     },
     {
       "id": 2,
       "name": "Bas$ket Manager",
       "slug": "basket-manager",
       "description": "A PHP exercise that I took some steps further to practice MVC architecture, object-oriented programming and form management.",
       "tags": [
         "PHP",
         "OOP",
         "MVC"
       ],
       "image": "https://gregoryalbouy.com/media/images/projects/basketmanager.jpg",
       "demo": "https://gregoryalbouy.com/demo/basketmanager",
       "is_hidden": false,
       "added_on": 1598446458,
       "edited_on": 1598448661
     },
     {
       "id": 1,
       "name": "Sarah Cornish",
       "slug": "sarah-cornish",
       "description": "My very first integration in pure HTML and CSS. Design by Zhenya Rynzhuk.",
       "tags": [],
       "image": "https://gregoryalbouy.com/media/images/projects/sarahcornish.jpg",
       "demo": "https://gregoryalbouy.com/demo/sarahcornish",
       "is_hidden": false,
       "added_on": 1598446359,
       "edited_on": 1598448596
     }
   ]
-}
