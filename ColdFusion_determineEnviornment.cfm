<!-- Determine enviornment by computer name -->

<cflock timeout="20" throwontimeout="yes" type="exclusive" scope="application">

	<cfif not isdefined("APPLICATION.serverName")>
    
		<cfregistry
				action="get"
				branch="hkey_local_machine\system"
				entry="computername"
				type="string"
				variable="APPLICATION.serverName">
            
	<cfelse>
	
	</cfif>

	<!-- Copy the server name to the REQUEST SCOPE to avoid excessive use of locking -->
	
		<cfset REQUEST.serverName = Duplicate(APPLICATION.serverName) />

</cflock>

<cfscript>
	
	// Are we in the development or production envoirnment?

	switch(REQUEST.serverName) {
	
		case "COMPUTER":
		REQUEST.isLive = "0";
		break;
	
		default:
		REQUEST.isLive = "1"; }

</cfscript>