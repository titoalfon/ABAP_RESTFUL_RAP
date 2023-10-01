@EndUserText.label: 'Consumption Travel Approval'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_R_ATRAVEL_2C01
  provider contract transactional_query
  as projection on ZCDS_RE_TRAVEL_2C01

{
  key TravelId   as Travel_ID,
      AgencyId   as Agency_ID,
      CustomerId as Customer_ID,
      BeginDate  as FromDate,
      EndDate    as ToDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      Description,
      OverallStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Bookings : redirected to composition child ZC_ABOOKING_2C01,
      _Currency,
      _Customer
}
