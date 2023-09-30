@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Entity Bookings'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_E_BOOKING_2C01
  as select from ztb_booking_2c01 as Booking
  association        to parent ZCDS_RE_TRAVEL_2C01 as _Travel     on $projection.TravelId = _Travel.TravelId
  composition [0..*] of ZCDS_E_BOOKSPL_2C01        as _BookSpl
  association [1..1] to /DMO/I_Customer            as _Customer   on $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier             as _Carrier    on $projection.CarrierId = _Carrier.AirlineID
  association [1..*] to /DMO/I_Connection          as _Connection on $projection.ConnectionId = _Connection.ConnectionID
  association [0..1] to I_Currency                 as _Currency   on $projection.CurrencyCode = _Currency.Currency

{
      @ObjectModel.foreignKey.association: '_Travel'
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      @ObjectModel.foreignKey.association: '_Customer'
      customer_id     as CustomerId,
      @ObjectModel.foreignKey.association: '_Carrier'
      carrier_id      as CarrierId,
      @ObjectModel.foreignKey.association: '_Connection'
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      @ObjectModel.foreignKey.association: '_Currency'
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt,

      /* Associations */
      _Travel,
      _BookSpl,
      _Customer,
      _Currency,
      _Carrier,
      _Connection
}
