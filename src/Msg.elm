module Msg exposing (Msg(..))

import Browser
import Pages.AboutPage
import Pages.HomePage
import Url


type Msg
    = MsgUrlChanged Url.Url
    | MsgUrlRequested Browser.UrlRequest
    | MsgHomePage Pages.HomePage.Msg
    | MsgAboutPage Pages.AboutPage.Msg
