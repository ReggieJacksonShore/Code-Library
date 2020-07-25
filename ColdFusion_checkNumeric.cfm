<!-- Check field is numeric -->

<cfparam name="ATTRIBUTES.checkField" default="" type="string" />
<cfparam name="ATTRIBUTES.r_bFlag" default="0" type="boolean" />

<cfparam name="charactersOK" default="" />

<cfset checkPass = 0 />

<!-- assign ATTRIBUTE scope to VARIABLES scope -->

	<cfset checkField = ATTRIBUTES.checkField />

	<cfset l_goodChars = "0,1,2,3,4,5,6,7,8,9" />

<!-- extract all characters that are in this set -->

	<cfset charactersOK = spanIncluding(checkField,l_goodChars) />

<cfif Len(checkField) eq Len(charactersOK)>

	<cfset checkPass = 1 />

<cfelse>

	<cfset checkPass = 0 />

</cfif>

<!-- Assign variable back to the CALLER scope -->

	<cfset SetVariable("Caller.r_bFlag", checkPass) />