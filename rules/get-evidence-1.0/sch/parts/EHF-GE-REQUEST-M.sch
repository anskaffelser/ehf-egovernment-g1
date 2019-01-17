<?xml version="1.0" encoding="UTF-8"?>

  <pattern xmlns="http://purl.oclc.org/dsdl/schematron">
    
    <rule context="cac:TenderingCriterionProperty">
    <assert id="EHF-GE-R041"
      test="count(key('k_lineId',cbc:ID)) = 1"
      flag="fatal">Each evidence request line SHALL have a line identifier that is unique within the transaction.</assert>
    </rule>
    
    <rule context="cac:ApplicablePeriod">
      <assert id="EHF-GE-R042"
        test="(exists(cbc:EndDate) and exists(cbc:StartDate)) or (not(cbc:EndDate) and not(cbc:StartDate))"
        flag="fatal">If start or end date is used, both start date and end date must be present</assert>
      
      <!--<assert id="EHF-GE-R043"
        test="(exists(cbc:DurationMeasure) or (not(cbc:EndDate) and not(cbc:StartDate)))"
        flag="fatal">If duration period is used, neither start date or end date must be present</assert>-->
      
    </rule>
  </pattern>


