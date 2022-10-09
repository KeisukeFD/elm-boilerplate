module Icons.ToolingIcon exposing (..)

import Html exposing (Html)
import Html.Attributes as Attr
import Svg
import Svg.Attributes as SvgAttr


view : Html msg
view =
    Svg.svg
        [ Attr.attribute "aria-hidden" "true"
        , Attr.attribute "role" "img"
        , SvgAttr.class "iconify iconify--mdi"
        , SvgAttr.width "24"
        , SvgAttr.height "24"
        , SvgAttr.preserveAspectRatio "xMidYMid meet"
        , SvgAttr.viewBox "0 0 24 24"
        ]
        [ Svg.path
            [ SvgAttr.d "M20 18v-4h-3v1h-2v-1H9v1H7v-1H4v4h16M6.33 8l-1.74 4H7v-1h2v1h6v-1h2v1h2.41l-1.74-4H6.33M9 5v1h6V5H9m12.84 7.61c.1.22.16.48.16.8V18c0 .53-.21 1-.6 1.41c-.4.4-.85.59-1.4.59H4c-.55 0-1-.19-1.4-.59C2.21 19 2 18.53 2 18v-4.59c0-.32.06-.58.16-.8L4.5 7.22C4.84 6.41 5.45 6 6.33 6H7V5c0-.55.18-1 .57-1.41C7.96 3.2 8.44 3 9 3h6c.56 0 1.04.2 1.43.59c.39.41.57.86.57 1.41v1h.67c.88 0 1.49.41 1.83 1.22l2.34 5.39z"
            , SvgAttr.fill "currentColor"
            ]
            []
        ]
