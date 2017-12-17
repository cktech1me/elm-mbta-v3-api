module Model exposing (..)

import Time
import Http


type alias Prediction =
    { data : List PredictionElement
    , included : List RouteInclude
    }


type ResourceInclude
    = RouteResource RouteInclude
    | StopResource StopInclude


type alias PredictionElement =
    { id : String
    , attributes : PredictionAttributes
    }


type alias PredictionAttributes =
    { track : Maybe String
    , stopSuquence : Maybe Int
    , status : Maybe String
    , scheduleRelationShip : Maybe String
    , directionId : Int
    , departureTime : Maybe String
    , arrivalTime : Maybe String
    }


type alias RouteAttributes =
    { routeType : Int
    , sortOrder : Int
    , shortName : String
    , longName : String
    , directionNames : List String
    , description : String
    }


type alias StopAttributes =
    { wheelchairBoarding : String
    , name : String
    , longitude : String
    , latitude : String
    }


type alias RouteInclude =
    { resourceType : String
    , id : String
    , attributes : RouteAttributes
    }


type alias StopInclude =
    { resourceType : String
    , id : String
    , attributes : StopAttributes
    }


type alias Model =
    { predictions : Prediction
    , error : String
    }


type Msg
    = NoOp
    | GetPredictions Time.Time
    | ProcessResponse (Result Http.Error Prediction)
