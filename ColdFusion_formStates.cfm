<cfsilent>

    <!-- Used for state form fields. -->
      
    <!-- Declaring attributes -->
    
    <cfparam name="ATTRIBUTES.bRequired" default="0" type="boolean" />
    
    <cfparam name="ATTRIBUTES.fieldName" default="Unknown" type="string" />
    <cfparam name="ATTRIBUTES.fieldValue" default="0" type="string" />
    
    <cfset bRequired = ATTRIBUTES.bRequired />
            
    <cfset fieldName = ATTRIBUTES.fieldName />
    <cfset value = ATTRIBUTES.fieldValue />
    
</cfsilent>

<cfoutput>
	
    <cfif bRequired eq 1>
    
    	<select name="#fieldName#" class="req">
    
    <cfelse>
    	
        <select name="#fieldName#"> 
        
    </cfif>
    
        <option value="">Select One</option>
        
        <option value="AL" <cfif value EQ "AL">SELECTED<cfelse></cfif>>Alabama</option>
        <option value="AK" <cfif value EQ "AK">SELECTED<cfelse></cfif>>Alaska</option>
       	<option value="AZ" <cfif value EQ "AZ">SELECTED<cfelse></cfif>>Arizona</option>
        <option value="AR" <cfif value EQ "AR">SELECTED<cfelse></cfif>>Arkansas</option>
        <option value="CA" <cfif value EQ "CA">SELECTED<cfelse></cfif>>California</option>
        <option value="CO" <cfif value EQ "CO">SELECTED<cfelse></cfif>>Colorado</option>
        <option value="CT" <cfif value EQ "CT">SELECTED<cfelse></cfif>>Connecticut</option>
        <option value="DC" <cfif value EQ "DC">SELECTED<cfelse></cfif>>District of Columbia</option>
        <option value="DE" <cfif value EQ "DE">SELECTED<cfelse></cfif>>Delaware</option>
        <option value="FL" <cfif value EQ "FL">SELECTED<cfelse></cfif>>Florida</option>
        <option value="GA" <cfif value EQ "GA">SELECTED<cfelse></cfif>>Georgia</option>
        <option value="GU" <cfif value EQ "GU">SELECTED<cfelse></cfif>>Guam</option>
        <option value="HI" <cfif value EQ "HI">SELECTED<cfelse></cfif>>Hawaii</option>
        <option value="ID" <cfif value EQ "ID">SELECTED<cfelse></cfif>>Idaho</option>
        <option value="IL" <cfif value EQ "IL">SELECTED<cfelse></cfif>>Illinois</option>
        <option value="IN" <cfif value EQ "IN">SELECTED<cfelse></cfif>>Indiana</option>
        <option value="IA" <cfif value EQ "IA">SELECTED<cfelse></cfif>>Iowa</option>
        <option value="KS" <cfif value EQ "KS">SELECTED<cfelse></cfif>>Kansas</option>
        <option value="KY" <cfif value EQ "KY">SELECTED<cfelse></cfif>>Kentucky</option>
        <option value="LA" <cfif value EQ "LA">SELECTED<cfelse></cfif>>Louisiana</option>
        <option value="ME" <cfif value EQ "ME">SELECTED<cfelse></cfif>>Maine</option>
        <option value="MD" <cfif value EQ "MD">SELECTED<cfelse></cfif>>Maryland</option>
        <option value="MA" <cfif value EQ "MA">SELECTED<cfelse></cfif>>Massachusetts</option>
        <option value="MI" <cfif value EQ "MI">SELECTED<cfelse></cfif>>Michigan</option>
        <option value="MN" <cfif value EQ "MN">SELECTED<cfelse></cfif>>Minnesota</option>
        <option value="MS" <cfif value EQ "MS">SELECTED<cfelse></cfif>>Mississippi</option>
        <option value="MO" <cfif value EQ "MO">SELECTED<cfelse></cfif>>Missouri</option>
        <option value="MT" <cfif value EQ "MT">SELECTED<cfelse></cfif>>Montana</option>
        <option value="NE" <cfif value EQ "NE">SELECTED<cfelse></cfif>>Nebraska</option>
        <option value="NV" <cfif value EQ "NV">SELECTED<cfelse></cfif>>Nevada</option>
        <option value="NH" <cfif value EQ "NH">SELECTED<cfelse></cfif>>New Hampshire</option>
        <option value="NJ" <cfif value EQ "NJ">SELECTED<cfelse></cfif>>New Jersey</option>
        <option value="NM" <cfif value EQ "NM">SELECTED<cfelse></cfif>>New Mexico</option>
        <option value="NY" <cfif value EQ "NY">SELECTED<cfelse></cfif>>New York</option>
        <option value="NC" <cfif value EQ "NC">SELECTED<cfelse></cfif>>North Carolina</option>
        <option value="ND" <cfif value EQ "ND">SELECTED<cfelse></cfif>>North Dakota</option>
        <option value="OH" <cfif value EQ "OH">SELECTED<cfelse></cfif>>Ohio</option>
        <option value="OK" <cfif value EQ "OK">SELECTED<cfelse></cfif>>Oklahoma</option>
        <option value="OR" <cfif value EQ "OR">SELECTED<cfelse></cfif>>Oregon</option>
        <option value="PA" <cfif value EQ "PA">SELECTED<cfelse></cfif>>Pennsylvania</option>
     	<option value="PR" <cfif value EQ "PR">SELECTED<cfelse></cfif>>Puerto Rico</option>
        <option value="RI" <cfif value EQ "RI">SELECTED<cfelse></cfif>>Rhode Island</option>
        <option value="SC" <cfif value EQ "SC">SELECTED<cfelse></cfif>>South Carolina</option>
        <option value="SD" <cfif value EQ "SD">SELECTED<cfelse></cfif>>South Dakota</option>
        <option value="TN" <cfif value EQ "TN">SELECTED<cfelse></cfif>>Tennessee</option>
        <option value="TX" <cfif value EQ "TX">SELECTED<cfelse></cfif>>Texas</option>
        <option value="UT" <cfif value EQ "UT">SELECTED<cfelse></cfif>>Utah</option>
        <option value="VT" <cfif value EQ "VT">SELECTED<cfelse></cfif>>Vermont</option>
        <option value="VA" <cfif value EQ "VA">SELECTED<cfelse></cfif>>Virginia</option>
     	<option value="VI" <cfif value EQ "VI">SELECTED<cfelse></cfif>>Virgin Islands</option>
        <option value="WA" <cfif value EQ "WA">SELECTED<cfelse></cfif>>Washington</option>
        <option value="WV" <cfif value EQ "WV">SELECTED<cfelse></cfif>>West Virginia</option>
        <option value="WI" <cfif value EQ "WI">SELECTED<cfelse></cfif>>Wisconsin</option>
        <option value="WY" <cfif value EQ "WY">SELECTED<cfelse></cfif>>Wyoming</option>
        
    </select>
    
</cfoutput>