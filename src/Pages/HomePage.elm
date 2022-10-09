module Pages.HomePage exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (class, href, target)
import Icons.DocumentationIcon
import Icons.ToolingIcon


type alias Model =
    {}


initModel : Model
initModel =
    {}


type Msg
    = MsgDummy


view : Html msg
view =
    Html.main_ []
        [ viewWelcomeItem "Documentation"
            Icons.DocumentationIcon.view
            [ Html.text
                "Elm "
            , Html.a [ href "https://elm-lang.org/", target "_blank" ]
                [ Html.text "Official documentation" ]
            , Html.text
                " provides you with all information you need to get started."
            ]
        , viewWelcomeItem "Tooling"
            Icons.ToolingIcon.view
            [ Html.text "This project is served and bundled with "
            , Html.a [ href "https://vitejs.dev/guide/features.html", target "_blank" ] [ Html.text "Vite" ]
            , Html.text ". The recommended IDE setup is "
            , Html.a [ href "", target "_blank" ] [ Html.text "VSCode" ]
            , Html.text " + "
            , Html.a [ href "https://marketplace.visualstudio.com/items?itemName=Elmtooling.elm-ls-vscode", target "_blank" ] [ Html.text "Elm-Tooling" ]
            , Html.text "."
            , Html.br [] []
            , Html.text "More instructions are available in "
            , Html.code [] [ Html.text "README.md" ]
            ]
        ]


viewWelcomeItem : String -> Html msg -> List (Html msg) -> Html msg
viewWelcomeItem title icon content =
    Html.div [ class "item" ]
        [ Html.i [ class "icon" ] [ icon ]
        , Html.div [ class "details" ]
            (Html.h3 [] [ Html.text title ] :: content)
        ]


update : Msg -> Model -> ( Model, Cmd.Cmd Msg )
update msg model =
    case msg of
        MsgDummy ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
