<cfsilent>
    
    <!-- Loop through SESSION variables and copy them to REQUEST scope. -->
    
    <cflock scope="SESSION" type="readonly" timeout="20">
    
        <cfif isdefined("SESSION")>
            
            <cfloop collection="#session#" item="thiskey">
         
                <cfset null = setvariable("REQUEST.#thisKey#",SESSION[thiskey]) />
         
            </cfloop>
        
        <cfelse></cfif>
    
    </cflock>

</cfsilent>