module Model exposing (Model, initModel)

import Browser.Navigation
import Pages.AboutPage
import Pages.HomePage
import Url


type alias Model =
    { title : String
    , url : Url.Url
    , navigationKey : Browser.Navigation.Key
    , modelHomePage : Pages.HomePage.Model
    , modelAboutPage : Pages.AboutPage.Model
    }


initModel : Url.Url -> Browser.Navigation.Key -> Model
initModel url navigationKey =
    { title = "Elm vite template"
    , url = url
    , navigationKey = navigationKey
    , modelHomePage = Pages.HomePage.initModel
    , modelAboutPage = Pages.AboutPage.initModel
    }
