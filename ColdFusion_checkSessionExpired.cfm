<cfset bExpired = "false" />

<cflock scope="SESSION" timeout="30" type="READONLY">
	
	<cfif not isdefined("SESSION.browserSessionUUID")>
	
    	<cfset bExpired = "true" />
	
    <cfelse></cfif>
    
</cflock>

<cfif bExpired>

	<cf_showSessionExpired> 
    
    <!-- Abort --> <cfabort>

<cfelse></cfif>