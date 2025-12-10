@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface entity view for Student'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_Student_Pavs
  as select from zcim_rap_table
  association to ZI_Gender_RAP as _gender on $projection.Gender = _gender.Value
{
  key id             as Id,
      firstname      as Firstname,
      lastname       as Lastname,
      age            as Age,
      course         as Course,
      courseduration as Courseduration,
      status         as Status,
      gender         as Gender,
      dob            as Dob,
      _gender,
      _gender.Description as Genderdesc
}
