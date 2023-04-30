module Main exposing (main)

import Browser exposing (UrlRequest)
import Browser.Navigation
import Layout
import Model exposing (Model, initModel)
import Msg exposing (Msg)
import Page
import Pages.AboutPage
import Pages.HomePage
import Url


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = onUrlChange
        , onUrlRequest = onUrlRequest
        }


init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd msg )
init _ url navigationKey =
    ( initModel url navigationKey, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    { title = Page.getTitle model
    , body = [ Layout.viewContent model ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.MsgUrlChanged url ->
            ( { model | url = url }, Cmd.none )

        Msg.MsgUrlRequested urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Browser.Navigation.pushUrl model.navigationKey (Url.toString url) )

                Browser.External url ->
                    ( { model | title = url }, Browser.Navigation.load url )

        Msg.MsgHomePage homePageMsg ->
            let
                ( newHomePageModel, newCmd ) =
                    Pages.HomePage.update homePageMsg model.modelHomePage
            in
            ( { model | modelHomePage = newHomePageModel }, Cmd.map Msg.MsgHomePage newCmd )

        Msg.MsgAboutPage aboutPageMsg ->
            let
                ( newAboutPageModel, newCmd ) =
                    Pages.AboutPage.update aboutPageMsg model.modelAboutPage
            in
            ( { model | modelAboutPage = newAboutPageModel }, Cmd.map Msg.MsgAboutPage newCmd )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map Msg.MsgHomePage (Pages.HomePage.subscriptions model.modelHomePage)
        , Sub.map Msg.MsgAboutPage (Pages.AboutPage.subscriptions model.modelAboutPage)
        ]


onUrlChange : Url.Url -> Msg
onUrlChange url =
    Msg.MsgUrlChanged url


onUrlRequest : UrlRequest -> Msg
onUrlRequest url =
    Msg.MsgUrlRequested url
