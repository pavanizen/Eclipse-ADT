@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier detail'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_Carrier_Tec_R
  as select from /dmo/carrier
{
  key carrier_id    as CarrierId,
      @Semantics.text: true
      name          as Name,
      currency_code as CurrencyCode

}
