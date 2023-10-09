@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Entity Booking Suplement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_E_BOOKSPL_2C01
  as select from ztb_bookspl_2c01
  association        to parent ZCDS_E_BOOKING_2C01 as _Booking    on  $projection.BookingId = _Booking.BookingId
                                                                  and $projection.TravelId  = _Booking.TravelId
  association [1..1] to ZCDS_RE_TRAVEL_2C01        as _Travel     on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement          as _Supplement on  $projection.SupplementId = _Supplement.SupplementID
  association [1..*] to /DMO/I_SupplementText      as _SuppText   on  $projection.SupplementId = _SuppText.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.lastChangedAt: true
      _Travel.LastChangedAt as LastChangedAt,

      /* Associations */
      _Booking,
      _Travel,
      _Supplement,
      _SuppText
}
