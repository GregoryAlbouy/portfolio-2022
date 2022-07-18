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


map : (Project -> a) -> List a
map f =
    List.map f all


all : List Project
all =
    [ { name = "Portfolio API (Go+SQL)"
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
    , { name = "Portfolio API (Node.js+MongoDB)"
      , slug = "portfolio-2020-api"
      , desc = "Portfolio API for project data and message handling. Deployed on Google App Engine."
      , tags =
            [ "Node.js"
            , "MongoDB"
            , "GCloud"
            , "Back-end"
            , "REST API"
            ]
      , repo = Nothing
      , demo = Nothing
      , image = Nothing
      , date = 1598447722
      }
    , { name = "Codemon"
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
    , { name = "React-dex", slug = "react-dex", desc = "Pokedex made in React fetching the PokeAPI. An occasion to practise forms handling with many filter combinations.\"", tags = [ "React", "Fetch API", "Sass" ], image = "https://gregoryalbouy.com/media/images/projects/react-dex.jpg" |> Url.fromString, repo = "https://github.com/gregoryalbouy/react-dex" |> Url.fromString, demo = "https://gregoryalbouy.github.io/react-dex/build/" |> Url.fromString, date = 1598447195 }
    , { name = "Webcomponents Framework"
      , slug = "webcomponents-framework"
      , desc = "Architecture & logics template for component-oriented webapps using Custom Elements with separate template files and no configuration."
      , tags =
            [ "Web components"
            , "TypeScript"
            , "Sass"
            , "Webpack"
            , "Developer tool"
            ]
      , image = "https://gregoryalbouy.com/media/images/projects/webcomponents-framework.jpg" |> Url.fromString
      , repo = "https://github.com/gregoryalbouy/webcomponents-framework" |> Url.fromString
      , demo = Nothing
      , date = 1598446923
      }
    , { name = "Webcomponents boilerplate"
      , slug = "webcomponents-boilerplate"
      , desc = "Lightweight vanilla JavaScript solution for ready-to-use Web components with separate HTML and style files."
      , tags =
            [ "Web components"
            , "ES6 modules"
            , "Fetch API"
            , "Sass"
            , "Developer tool"
            ]
      , image = "https://gregoryalbouy.com/media/images/projects/webcomponents-boilerplate.jpg" |> Url.fromString
      , repo = "https://github.com/gregoryalbouy/webcomponents-boilerplate" |> Url.fromString
      , demo = Nothing
      , date = 1598446774
      }
    , { name = "Ebuilder-js"
      , slug = "ebuilder-js"
      , desc = "Lightweight library published on npm allowing to build and manipulate elements in a single statement, with a functionnal touch."
      , tags =
            [ "TypeScript"
            , "Webpack"
            , "NPM package"
            , "Developer tool"
            ]
      , repo = "https://github.com/gregoryalbouy/ebuilder" |> Url.fromString
      , demo = Nothing
      , image = Nothing
      , date = 1598446695
      }
    , { name = "GridChecker"
      , slug = "grid-checker"
      , desc = "Highly configurable Custom Element <grid-checker> that allows to check visually if an integration is conform to the designer's grid."
      , tags =
            [ "Web Components"
            , "TypeScript"
            , "Webpack"
            , "Developer tool"
            ]
      , image = "https://gregoryalbouy.com/media/images/projects/gridchecker.jpg" |> Url.fromString
      , repo = "https://github.com/gregoryalbouy/gridchecker" |> Url.fromString
      , demo = Nothing
      , date = 1598446614
      }
    , { name = "Virtual Gameboy"
      , slug = "virtual-gameboy"
      , desc = "2 hours exam. A simple Gameboy COLOR like the one I got 20 years ago (and still have!). No game in it, sorry!"
      , tags =
            [ "Sass"
            , "3D CSS"
            ]
      , image = "https://gregoryalbouy.com/media/images/projects/gameboycolor.jpg" |> Url.fromString
      , repo = Nothing
      , demo = "https://gregoryalbouy.com/demo/gameboy-color" |> Url.fromString
      , date = 1598446531
      }
    , { name = "Bas$ket Manager"
      , slug = "basket-manager"
      , desc = "A PHP exercise that I took some steps further to practice MVC architecture, object-oriented programming and form management."
      , tags =
            [ "PHP"
            , "OOP"
            , "MVC"
            ]
      , image = "https://gregoryalbouy.com/media/images/projects/basketmanager.jpg" |> Url.fromString
      , repo = Nothing
      , demo = "https://gregoryalbouy.com/demo/basketmanager" |> Url.fromString
      , date = 1598446458
      }
    , { name = "Sarah Cornish"
      , slug = "sarah-cornish"
      , desc = "My very first integration in pure HTML and CSS. Design by Zhenya Rynzhuk."
      , tags = []
      , image = "https://gregoryalbouy.com/media/images/projects/sarahcornish.jpg" |> Url.fromString
      , repo = Nothing
      , demo = "https://gregoryalbouy.com/demo/sarahcornish" |> Url.fromString
      , date = 1598446359
      }
    ]



{-
   [
     ,
     ,
     ,
   ]
-}
