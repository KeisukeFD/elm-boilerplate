module Page exposing (..)

import Html exposing (Html)
import Model exposing (Model)
import Pages.AboutPage
import Pages.HomePage
import Router


getTitle : Model -> String
getTitle model =
    if model.url.path == "/about" then
        "About me"

    else
        model.title


viewPage : Model -> Html msg
viewPage model =
    case Router.fromUrl model.url of
        Just Router.RouteAboutPage ->
            Pages.AboutPage.view

        Just Router.RouteHomePage ->
            Pages.HomePage.view

        Nothing ->
            Html.text "404 - Not found !"
