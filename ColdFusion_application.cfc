<cfcomponent 
    displayname="Application Component" 
    hint="I am the application component."
    output="no">

        <cfscript>

									//The Application Name
									
													THIS.name = "ApplicationName";
									
									//How long the application variables persist
									
													THIS.applicationTimeout = createTimeSpan(0,0,10,0);
									
									//Session Managment
																
													THIS.sessionManagement = "Yes";
													THIS.sessionTimeout = createTimeSpan(0,0,10,0);
													
													THIS.setClientCookies = "Yes";
									
        </cfscript>
        
        <!-- Coldfusion administrator override settings -->
        
        <cfsetting showdebugoutput="No" requestTimeout="#createTimeSpan(0,0,0,20)#">
           
    <!-- Application Start -->

    <cffunction 
        name="onApplicationStart" 
        returnType="boolean" 
        output="no">  
            
            <cflog type="Information" text="The application was started" />
            
            <cfscript>
            
                // Application Variables
                
                    APPLICATION.DTASRC = "";
                    APPLICATION.FOLDER_ROOT = "C:\inetpub\wwwroot";  
                    APPLICATION.FOLDER_BAK = "C:\inetpub\wwwroot\bak"; 
                    
                    APPLICATION.EMAILFROM = "Do-Not-Respond";  
                
                // Request Variables
                    
                // Attributes Variables
                
                    ATTRIBUTES.TITLE = "";
            
            </cfscript>

        <cfreturn true>

    </cffunction>
    
    <!-- Missing Template -->
    
    <cffunction name="onMissingTemplate"> 
    
        <cfargument name="targetPage" type="string" required=true /> 
        
        <cftry> 
        
            <!-- Log error --> 
            
            <cflog type="error" text="Missing template: #Arguments.targetPage#"> 
       
             <!-- Disply error to user -->
                 
            <cfoutput> 
                
                #Arguments.targetPage# not found. 
                 
            </cfoutput> 
            
            <cfreturn true /> 
            
            <!-- If an error occurs, return false and the default error handler will run. --> 
            
            <cfcatch> 
            
                <cfreturn false /> 
           
            </cfcatch> 
        
        </cftry> 
    
    </cffunction>

    <!-- On Error -->

    <cffunction 
        name="onError" 
        returntype="void" 
        output="yes"> 
        
        <!-- Log the error. -->
            <cflog type="error" text="An error happened">

        <!-- Output the error for degugging. --> 
            <cfdump var="#except#" />
        
        <!-- Include an error template. -->
            <cfinclude template = "/error.cfm">
        
    </cffunction>

    <!-- Session Start -->

        <cffunction name="onSessionStart"> 
            
                <cfif isdefined("SESSION.mySession")>
                
                <cfelse>
                
                    <cflock timeout=20 scope="Session" type="Exclusive"> 
                    
                        <cfscript> 
                         
                            Session.mySession = StructNew(); 
                            Session.mySession.userAgent = CGI.HTTP_USER_AGENT; 
                        
                        </cfscript> 
                    
                    </cflock>
                          
                </cfif>
            
        </cffunction>

    <!-- Session End -->
    
        <cffunction name="onSessionEnd" returnType="void"> 
            
            <!-- Clean up session. -->
        
        </cffunction>

    <!-- Request Start -->

    <cffunction 
        name="onRequestStart" 
        returntype="boolean" 
        output="yes"> 

        <!-- Applicaiton level security -->

        <cfif CGI.QUERY_STRING CONTAINS "SELECT" 
            OR CGI.QUERY_STRING CONTAINS "DECLARE"
            OR CGI.QUERY_STRING CONTAINS "EXEC" 
            OR CGI.QUERY_STRING CONTAINS "CONVERT" 
            OR CGI.QUERY_STRING CONTAINS "TABLE" 
            OR CGI.QUERY_STRING CONTAINS "'" 
            OR CGI.QUERY_STRING CONTAINS "-" 
            OR CGI.QUERY_STRING CONTAINS "%" 
            OR CGI.QUERY_STRING CONTAINS "." 
            OR CGI.QUERY_STRING CONTAINS "ALERT">
            
            <!-- Log --> 
            
            <cf__log title="Blacklisted" entry="Abort">
          
            <cfabort> <!-- Stop processing --> 
        
        <cfelse></cfif>
        
        <!-- Request variables -->
        
            <cfscript>
                
                // Dates
        
                    REQUEST.THEDATE = Now();
                    REQUEST.YYYY = DateFormat(REQUEST.THEDATE,'YYYY');
                    REQUEST.YYYYMMDD = DateFormat(REQUEST.THEDATE,'YYYYMMDD');
                    REQUEST.DDDD = DateFormat(REQUEST.THEDATE,'DDDD');  
            
            </cfscript>
       
        <!-- Copy session variables to request scope -->
        
            <cf_copySession>
            
        <!-- Clean up the user submitted values -->
        
            <cfinclude template = "sanatizeUserInput.cfm">

            <!-- For Debugging; -->
            <!-- <cfdump var="#SESSION#" label="Session" expand="no" /> -->
            <!-- <cfdump var="#REQUEST#" label="Request" expand="no" /> -->
               
        <cfreturn true>
        
    </cffunction>
    
    <!-- Request End -->
    
    <cffunction 
        name="onRequestEnd" 
        returntype="boolean" 
        output="yes"> 
            
            <!--

            <cfdump var="#createUUID()#" />
            
            <cfdump var="#APPLICATION#" label="Application" expand="no" />
            <cfdump var="#SESSION#" label="Session" expand="yes" />
            <cfdump var="#REQUEST#" label="Request" expand="no" />
            <cfdump var="#CLIENT#" label="Client" expand="yes" />
            <cfdump var="#COOKIE#" label="Cookie" expand="yes" />
            <cfdump var="#CGI#" label="CGI" expand="no" />
            <cfdump var="#FORM#" label="Form" />
            <cfdump var="#URL#" label="URL" /> -->

        <cfreturn true>
          
    </cffunction>
    
    <!-- Application End -->
    
    <cffunction name="onApplicationEnd"> 
        
        <cfargument name="ApplicationScope" required="yes" /> 
        
        <cflog file="#This.Name#" 
            type="Information"  
            text="Application #Arguments.ApplicationScope.applicationname# Ended" >
        
        <cflog type="Information" text="The application was ended" />
        
        <!-- Does not need a return tag because it does not return anything. -->
        
    </cffunction>
    
</cfcomponent>