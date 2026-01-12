@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for Academic Result'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_AR_PAVS as select from zcim_rap_ar_pavs
{
    key id as Id,
    key course as Course,
    key semester as Semester,
    semresult as Semresult
}
