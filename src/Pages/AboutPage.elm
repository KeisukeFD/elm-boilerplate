module Pages.AboutPage exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (class)


type alias Model =
    {}


initModel : Model
initModel =
    {}


type Msg
    = MsgDummy


view : Html msg
view =
    Html.div [ class "about" ]
        [ Html.h1 []
            [ Html.text "This is a great About page !"
            ]
        ]


update : Msg -> Model -> ( Model, Cmd.Cmd Msg )
update msg model =
    case msg of
        MsgDummy ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
