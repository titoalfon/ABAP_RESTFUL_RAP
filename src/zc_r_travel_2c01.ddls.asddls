@EndUserText.label: 'Consumption Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_R_TRAVEL_2C01
  provider contract transactional_query
  as projection on ZCDS_RE_TRAVEL_2C01

{
  key TravelId           as Travel_ID,
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId           as Agency_ID,
      _Agency.Name       as AgencyName,
      CustomerId         as Customer_ID,
      @ObjectModel.text.element: [ 'CustomerName' ]
      _Customer.LastName as CustomerName,
      BeginDate          as FromDate,
      EndDate            as ToDate,
      @Semantics.amount.currencyCode: 'Currency'
      BookingFee         as Fee,
      @Semantics.amount.currencyCode: 'Currency'
      TotalPrice         as Total,
      @Semantics.currencyCode: true
      CurrencyCode       as Currency,
      Description,
      OverallStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Bookings : redirected to composition child ZC_BOOKING_2C01,
      _Currency,
      _Customer
}
