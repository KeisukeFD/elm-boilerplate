module Router exposing (..)

import Url
import Url.Parser exposing (map, oneOf, parse, s, top)


type Route
    = RouteHomePage
    | RouteAboutPage


routerParser : Url.Parser.Parser (Route -> c) c
routerParser =
    oneOf
        [ map RouteAboutPage (s "about")
        , map RouteHomePage top
        ]


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    parse routerParser url


asPath : Route -> String
asPath route =
    case route of
        RouteAboutPage ->
            "/about"

        RouteHomePage ->
            "/"
