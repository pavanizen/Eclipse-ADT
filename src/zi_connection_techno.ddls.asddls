@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection View CDS Data Model'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: {
    typeName: 'Connection',
    typeNamePlural: 'Connections'

}
define view entity ZI_Connection_Techno
  as select from /dmo/connection as Connection
  association [1..*] to ZI_flight_TEC_R  as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                     and $projection.ConnectionId = _Flight.ConnectionId

  association [1]    to ZI_Carrier_Tec_R as _Airline on  $projection.CarrierId = _Airline.CarrierId
{
      @UI.facet: [{
      id: 'Connection',
        purpose: #STANDARD,
        type:#IDENTIFICATION_REFERENCE,
        label: 'Connection',
        position: 10 },
        {
        id: 'Flight',
        purpose: #STANDARD,
        type:#LINEITEM_REFERENCE,
        label: 'Flights',
        position: 20,
        targetElement: '_Flight' }


       ]


      @UI: { lineItem: [{ position: 10, label: 'Airline' }  ],
      identification: [{position: 10, label: 'Airline'  }] }
      @ObjectModel.text.association: '_Airline'
  key carrier_id                             as CarrierId,
      @UI: { lineItem: [{ position: 20  }],
      identification: [{ position: 20  }] }
  key connection_id                          as ConnectionId,
      @UI: { selectionField: [{ position: 10  }],
      lineItem: [{ position: 30  }] ,
      identification: [{ position: 30  }]}
      airport_from_id                        as AirportFromId,
      @UI: { selectionField: [{ position: 20  }],
      lineItem: [{ position: 40  }],
      identification: [{ position: 40  }] }
      airport_to_id                          as AirportToId,
      @UI: { lineItem: [{ position: 50,label: 'Departure time'  }],
       identification: [{ position: 50  }] }
      departure_time                         as DepartureTime,
      @UI: { lineItem: [{ position: 60 , label :'Arrival time' }],
      identification: [{ position: 60  }]  }
      arrival_time                           as ArrivalTime,

      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      @UI: { identification: [{ position: 70  }]  }
      cast( distance as abap.quan( 15, 3 ) ) as Distance,
      distance_unit                          as DistanceUnit,

      //Association
      _Flight,
      _Airline
}
