@EndUserText.label: 'Consumption Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_BOOKING_2C01
  as projection on ZCDS_E_BOOKING_2C01
{
  key TravelId      as Travel_ID,
  key BookingId     as Booking_ID,
      BookingDate,
      CustomerId    as Customer_ID,
      @ObjectModel.text.element: [ 'AirlineName' ]
      CarrierId     as Airline,
      _Carrier.Name as AirlineName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'Currency'
      FlightPrice   as Price,
      @Semantics.currencyCode: true
      CurrencyCode  as Currency,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _BookSpl : redirected to composition child ZC_BOOKSPL_2C01,
      _Carrier,
      _Connection,
      _Customer,
      _Travel  : redirected to parent ZC_R_TRAVEL_2C01
}
