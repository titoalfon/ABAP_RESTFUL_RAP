@EndUserText.label: 'Consumption Book. Suppl'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_BOOKSPL_2C01
  as projection on ZCDS_E_BOOKSPL_2C01

{
  key TravelId              as Travel_ID,
  key BookingId             as Booking_ID,
  key BookingSupplementId   as BookSupplement_ID,
      @ObjectModel.text.element: ['SupplementDescription']
      SupplementId          as Supplement_ID,
      _SuppText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'Currency'
      Price,
      CurrencyCode          as Currency,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZC_BOOKING_2C01,
      _Supplement,
      _SuppText,
      _Travel  : redirected to ZC_R_TRAVEL_2C01
}
