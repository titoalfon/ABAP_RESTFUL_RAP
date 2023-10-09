@EndUserText.label: 'Consumption Booking Approval'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_ABOOKING_2C01
  as projection on ZCDS_E_BOOKING_2C01
{
  key TravelId as Travel_ID,
  key BookingId as Booking_ID,
      BookingDate,
      CustomerId,
      @ObjectModel.text.element: ['AirlineName']
      CarrierId as Airline,
      _Carrier.Name as AirlineName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      //  _BookSpl,
      _Carrier,
      //  _Connection,
      //  _Currency,
      _Customer,
      _Travel : redirected to parent ZC_R_ATRAVEL_2C01
}
