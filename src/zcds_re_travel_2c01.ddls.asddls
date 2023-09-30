@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Root Entity Travel'
define root view entity ZCDS_RE_TRAVEL_2C01
  as select from ztb_travel_2c01
  composition [0..*] of ZCDS_E_BOOKING_2C01 as _Bookings
  association [0..1] to /DMO/I_Agency       as _Agency   on $projection.AgencyId = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer     as _Customer on $projection.CustomerId = _Customer.CustomerID
  association [0..1] to I_Currency          as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key travel_id       as TravelId,
      @ObjectModel.foreignKey.association: '_Agency'
      agency_id       as AgencyId,
      @ObjectModel.foreignKey.association: '_Customer'
      customer_id     as CustomerId,
      begin_date      as BeginDate,
      end_date        as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price     as TotalPrice,
      @ObjectModel.foreignKey.association: '_Currency'
      currency_code   as CurrencyCode,
      @Semantics.text: true
      description     as Description,
      overall_status  as OverallStatus,
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      /* Associations */
      _Bookings, // Make association public
      _Agency,
      _Customer,
      _Currency
}
