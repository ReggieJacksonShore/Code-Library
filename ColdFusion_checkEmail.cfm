<!-- Check if field is valid email -->

    <cfparam name="ATTRIBUTES.checkField" default="" type="string" />
    <cfparam name="ATTRIBUTES.r_bFlag" default="0" type="boolean" />
    
    <cfparam name="charactersOK" default="" />
    
    <cfset checkFlag = 0 />

<!-- Assign ATTRIBUTE scope to VARIABLES scope -->

	<cfset checkField = ATTRIBUTES.checkField />
    
<!-- Check if field is long enough -->

	<cfif LEN(checkField) lt 4>
        
        <cfset checkFlag = 1 />
        
    <cfelse></cfif>

<!-- Extract all characters that are in this set -->
	
    <cfif REFIND('.+@.+\..+',checkField)>
        
    <cfelse>
    
        <cfset checkFlag = 1 />
    
    </cfif>

<!-- Assign variable back to the CALLER scope -->

	<cfset SetVariable("Caller.r_bFlag", checkFlag) />