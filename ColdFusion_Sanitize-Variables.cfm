<cfsilent>

    <!-- If we have form fields, loop through each one -->
    
    <cfif isdefined("FORM.fieldnames")>
        
        <cfloop list="#FORM.fieldnames#" index="thisFormField">
    
            <!-- Do not trim image uploads -->	
            
			<cfif lcase(right(thisFormField,5)) eq "image">
                
            <cfelse>
            	
                <cfset o = setvariable("FORM.#thisformfield#",HTMLEDITFORMAT(TRIM(form[thisformfield]))) />
                
            </cfif>
        
        </cfloop>	
        
    <cfelse></cfif>

    <!-- 
        Loop through the collection of url variables -->
         
    <cftry>
          
        <cfloop collection="#url#" item="thisfield">
            
            <cfif thisfield neq "">
    
                <cfset o = setvariable("URL.#thisfield#",HTMLEDITFORMAT(TRIM(url[thisfield]))) />
                
            <cfelse></cfif>
    
        </cfloop>
    
        <cfcatch type="Any">
        
        	<cfabort> <!-- Stop processing -->
            
        </cfcatch>
    
    </cftry>

</cfsilent>