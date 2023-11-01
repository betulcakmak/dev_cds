@AbapCatalog.sqlViewName: 'ZBC_CDS_V003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds Ödev'
define view ZBC_CDS_003 as select from ZBC_CDS_002 as cds2
{
  cds2.vbeln,
  sum(cds2.conversion_netwr) as Toplam_Net_Deger,
  cds2.kunnrAd,
  count(*) as Toplam_Fatura_Adedi,
  division(cast( sum(conversion_netwr) as abap.curr( 10, 3 ) ),
           cast( count(*) as abap.int1 ), 3) as Ortalama_Miktar,
  left(fkdat,4) as Faturalama_Yili,
  substring(fkdat,5,2) as Faturalama_Ayi,
  substring(fkdat,7,2) as Faturalama_Gunu,
  substring(inco2_l,1,3) as Incoterm_Yeri,
  fkdat 
}
  group by
  cds2.vbeln,
  cds2.kunnrAd,
  cds2.fkdat,
  cds2.inco2_l
