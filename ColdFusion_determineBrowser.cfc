<cfcomponent output="no" hint="Data">
    
    <!-- Use the user agent to get the browser and the browser version -->
    
    <cffunction name="getBrowser" hint="Data" returntype="struct" output="no">
        
        <cfargument name="userAgent" type="string" required="yes" hint="The user agent" />
        
        <cfset var browserData = structNew() />
        
        <cfset browserData.userAgent = ARGUMENTS.userAgent />
        <cfset broswerData.userBrowserName = "Unknown" />
        <cfset browserData.userBrowserVersion = 0 />
        <cfset browserData.userIsModern = 0 />
		
        <!-- Define all browsers and do some browser sniffing -->
        
		<cfscript>
					
			var BrowserList = "";

		</cfscript>
        		
        <!-- Define modern browsers for using the website and check if user is using modern browser -->
       	
        <cfswitch expression="#broswerData.userBrowserName#">
        	<cfcase value="Chrome">
                
                <cfif browserData.userBrowserVersion gte 30>
                
                	<cfset browserData.userIsModern = 1 />
                
                <cfelse></cfif>
            
            </cfcase>
            <cfcase value="MSIE">

                <cfif browserData.userBrowserVersion gte 7>
                
                	<cfset browserData.userIsModern = 1 />
                
                <cfelse></cfif>
                         
            </cfcase>
            <cfcase value="Firefox">

                <cfif browserData.userBrowserVersion gte 27>
                
                	<cfset browserData.userIsModern = 1 />
                
                <cfelse></cfif>
                
            </cfcase>
            <cfcase value="Safari">
                
				<cfif browserData.userBrowserVersion gte 7>
                
                	<cfset browserData.userIsModern = 1 />
                
                <cfelse></cfif>         
            
            </cfcase>
            <cfcase value="Opera">
            
                <cfif browserData.userBrowserVersion gte 14>
                
                	<cfset browserData.userIsModern = 1 />
                
                <cfelse></cfif>
                            
            </cfcase>
            <cfdefaultcase></cfdefaultcase>
        </cfswitch>
        
        <!-- Return the final structure -->
        
        <cfreturn browserData>
    
    </cffunction>

	<!-- Print out the browser and the browser version -->
    
    <cffunction name="printBrowser" returntype="void" access="public" output="yes">
    	
        <cfinvoke method="getBrowser" returnvariable="browserData" argumentcollection="#ARGUMENTS#" />
        
        <!--Debugging; <cfdump var="#browserData#" />-->
        
        <cfif browserData.userIsModern>
        
            <div id="note-good">
            
            	Web brower detected as #broswerData.userBrowserName# ver. #browserData.userBrowserVersion#. 
                Your browser is supported.<br />#CGI.HTTP_USER_AGENT#
            
            </div>
            
        <cfelse>
        
            <div id="note-bad">
            
            	Web browser detected as #broswerData.userBrowserName# ver. #browserData.userBrowserVersion#. 
                Your browser is not supported.<br />#CGI.HTTP_USER_AGENT#
                
        	</div>
            
        </cfif>
    
    </cffunction>

</cfcomponent>