<cfif CGI.HTTPS eq 1>
	 
<cfelse>

	<!--<cfset local.protocol = "https://" />
            	
    <cfset local.url = (
            local.protocol &
            cgi.server_name &
            cgi.script_name &
            "?" &
            cgi.query_string
            ) />
            
	<cflocation url="#local.url#" addtoken="no" />-->
            
</cfif>