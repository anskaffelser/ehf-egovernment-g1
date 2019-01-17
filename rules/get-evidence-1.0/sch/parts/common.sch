<?xml version="1.0" encoding="UTF-8"?>

  <pattern xmlns="http://purl.oclc.org/dsdl/schematron">

    <rule context="/*">
      <assert id="EHF-GE-R003"
              test="not(@*:schemaLocation)"
              flag="warning">Document SHOULD not contain schema location.</assert>
    </rule>
    
    <rule context="*:EndpointID[@schemeID = '0192']">
      <assert id="EHF-GE-R010"
              test="matches(., '^[0-9]{9}$') and u:mod11(.)"
              flag="fatal">MUST be a valid Norwegian organization number. Only numerical value allowed</assert>
    </rule>

    <rule context="*:PartyIdentification/cbc:ID[@schemeID = '0192']">
      <assert id="EHF-GE-R011"
              test="matches(., '^[0-9]{9}$') and u:mod11(.)"
              flag="fatal">When scheme is 0192, a valid Norwegian organization number must be used. Only numerical value allowed</assert>
    </rule>
   
   
    <rule context="cbc:IssueDate|cbc:StartDate|cbc:EndDate|cbc:ResponseDate">
      <assert id="EHF-GE-R030"
              test="(string(.) castable as xs:date) and (string-length(.) = 10)"
              flag="fatal">A date must be formatted YYYY-MM-DD.</assert>
    </rule>
    

    <rule context="cac:ApplicablePeriod |cac:PlannedPerid">
      <assert id="EHF-GE-R031"
        test="(exists(cbc:EndDate) and exists(cbc:StartDate) and (cbc:EndDate) &gt;= (cbc:StartDate)) or not(exists(cbc:StartDate)) or not(exists(cbc:EndDate))"
        flag="fatal">The end date shall be later or equal to the start date.</assert>
      
      <assert id="EHF-GE-R042"
        test="(exists(cbc:EndDate) and exists(cbc:StartDate)) or (not(cbc:EndDate) and not(cbc:StartDate))"
        flag="fatal">If start or end date is used, both start date and end date must be present</assert>
    </rule>
    
  </pattern>


