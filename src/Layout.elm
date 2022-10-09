module Layout exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (class, href, id, src)
import Model exposing (Model)
import Page
import VitePluginHelper


viewContent : Model -> Html msg
viewContent model =
    Html.div [ id "app" ]
        [ Html.header []
            [ Html.img [ src <| VitePluginHelper.asset "/src/assets/logo.png?inline", class "logo w-80" ] []
            , Html.div [ class "wrapper" ]
                [ Html.nav []
                    [ Html.a [ href "/", class (getUrlActiveCls model "/") ]
                        [ Html.text "Home"
                        ]
                    , Html.a [ href "/about", class (getUrlActiveCls model "/about") ]
                        [ Html.text "About"
                        ]
                    ]
                ]
            ]
        , Page.viewPage model
        ]


getUrlActiveCls : Model -> String -> String
getUrlActiveCls model forUrl =
    if model.url.path == forUrl then
        "active"

    else
        ""
