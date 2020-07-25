<cfsilent>
	
    <!-- Used for date form fields. -->

    <!-- Declaring attributes -->
        
	<cfset value = trim(ATTRIBUTES.value) />
    
    <cfparam name="ATTRIBUTES.bRequired" default="0" type="boolean" />
    
    <cfif len(value) eq 8>
		
        <cfset value_year = LEFT(value,4) />
        <cfset value_month = MID(value,5,2) />
        <cfset value_day = RIGHT(value,2) />
        
    <cfelse>
    	
        <cfset value_year = "" />
        <cfset value_month = "" />
        <cfset value_day = "" />
        
    </cfif>
    
    <cfif ATTRIBUTES.bShowDayPortion eq 0>
        
        <cfset value_day = "00" />
    
    <cfelse></cfif>

</cfsilent>

<cfoutput>

	<cfset monthFieldName = ATTRIBUTES.fieldName & "_month" />
    
		<cfif ATTRIBUTES.bRequired eq 1>
        
            <select name="#monthFieldName#" class="req">
        
        <cfelse>
        
            <select name="#monthFieldName#">
        
        </cfif>
    
    	<option value="">Month</option>
        
        <cfloop index="datenumber" from="1" to="12" step="1">
        	
            <cfif value_month eq datenumber>
            
            	<option value="#NumberFormat(datenumber,'09')#" SELECTED>#datenumber#</option>
        	
            <cfelse>
            
            	<option value="#NumberFormat(datenumber,'09')#">#datenumber#</option>
            
            </cfif>
            
        </cfloop>
        
        
    </select>
    
    <cfset dayFieldName = ATTRIBUTES.fieldName & "_day" />
    
    <cfif ATTRIBUTES.bShowDayPortion eq 1> 
    	
        &nbsp;&nbsp; 
    
    	<cfif ATTRIBUTES.bRequired eq 1>
        
            <select name="#dayFieldName#" class="req">
            
        <cfelse>
            
            <select name="#dayFieldName#">
        
        </cfif>
        
        <option value="">Day</option>
            
            <cfloop index="daynumber" from="1" to="31">
            	
                <cfif value_day eq daynumber>
                
                	<option value="#NumberFormat(daynumber,'09')#" SELECTED>#daynumber#</option>
            	
                <cfelse>
                	
                    <option value="#NumberFormat(daynumber,'09')#" SELECTED>#daynumber#</option>
                    
                </cfif>
            
            </cfloop>
                
	</select>
    
    <cfelse>
    	
        <input type="hidden" name="#dayFieldName#" value="#value_day#" maxlength="2" />
        
    </cfif> &nbsp;&nbsp; 
	
	<cfset yearFieldName = ATTRIBUTES.fieldName & "_year" />
    
    <cfif ATTRIBUTES.bRequired eq 1>
    
    	<select name="#yearFieldName#" class="req">
    	
    <cfelse>
    
    	<select name="#yearFieldName#">    
        
    </cfif>
        
        <option value="">Year</option>
        
        <cfif ATTRIBUTES.bShowDayPortion eq 0>
        	
			<!-- For credit card start and end year -->
            
				<cfset yeartostartwith = REQUEST.YYYY + 11 />
                
                <cfset yeartoendwith = REQUEST.YYYY />
            
        
        <cfelse>

			<!-- For non credit card start end year -->
                 
				<cfset yeartostartwith = REQUEST.YYYY />
                
                <cfset yeartoendwith = 1900 />
        
        </cfif>	
            
        <cfloop from="#yeartostartwith#" to="#yeartoendwith#" index="i" step="-1">
            
            <cfif value_year eq i>
            
                <option value="#i#" SELECTED>#i#</option>
            
            <cfelse>
            
                <option value="#i#">#i#</option>      
            
            </cfif>
            
        </cfloop>
        
    </select>
    
</cfoutput>