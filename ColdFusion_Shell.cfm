<!-- Start shell -->

<cfif THISTAG.EXECUTIONMODE eq "start">

	<!doctype html>
    <html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="index, follow" />
    <meta name="copyright" content="Copyright. All rights reserved." /> 
    <meta name="author" content="" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    
    <title><cfoutput>#ATTRIBUTES.TITLE#</cfoutput></title>
    
    <!-- Cascading Style Sheets -->
    
    	<link href="/css/shared.css" rel="stylesheet" type="text/css">
    	<link href="/css/form.css" rel="stylesheet" type="text/css">
    
    <!-- Favicon -->
    
    	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
    
    <!-- Start of the head and body -->
    
    	</head>
        
        <body id="myBody"><a name="t"></a>

    <!-- CSS indicator; green desktop, yellow tablet and for red mobile -->
    	
        <div id="myCSS"></div>
          
	<!-- Header -->
        
        <div id="myHeader">
       
			<div id="myHeader-Left">
            
            	<a href="/" class="white">Logo</a>
            
            </div>
            
            <link href="/YOUR_PATH/favicon.ico" rel="icon" type="image/x-icon" /><div id="myHeader-Right">

                <div id="header-Menu">
                 
                <label for="toggleMenu" class="menu" 
                    onClick="document.getElementById('toggleMenu2').checked=false">		
                    
						<svg width="100%" height="100%">
                            <rect x="20%" y="23%" width="60%" height="12%" fill="white" />
                            <rect x="20%" y="45%" width="60%" height="12%" fill="white" />
                            <rect x="20%" y="67%" width="60%" height="12%" fill="white" />
                        </svg>
                    
                    </label>
                
                </div>
                
                <div id="header-Menu">
                 
                    <label for="toggleMenu2" class="menu" 
                        onClick="document.getElementById('toggleMenu').checked=false">	
           
						<svg width="100%" height="100%">
                            <circle cx="50%" cy="50%" r="40%" stroke="#cc6699" stroke-width="20%"	
								fill="white" />
								
                            <circle cx="50%" cy="50%" r="16%" fill="#cc6699" />
							
							<circle cx="50%" cy="50%" r="6%" fill="white" />
							
							<circle cx="50%" cy="15%" r="10%" fill="#cc6699" />
							<circle cx="50%" cy="85%" r="10%" fill="#cc6699" />	
							
							<circle cx="15%" cy="50%" r="10%" fill="#cc6699" />
							<circle cx="85%" cy="50%" r="10%" fill="#cc6699" />
							
							<circle cx="25%" cy="25%" r="10%" fill="#cc6699" />
							<circle cx="75%" cy="25%" r="10%" fill="#cc6699" />	
							
							<circle cx="75%" cy="75%" r="10%" fill="#cc6699" />
							<circle cx="25%" cy="75%" r="10%" fill="#cc6699" />					
						</svg>

   
                    </label>
                
                </div>
                
                <div id="header-Link">
                               
                	<a href="/Account/My-Account.cfm">My Account</a>
				
                </div>
                
            </div>

            <input type="checkbox" name="toggleMenu" id="toggleMenu" style="display:none" />
            
            <div id="myMenu">

				<cfscript>
                    
                    // Help links defined once in the shell 
                
                    helpLinks = arrayNew(2);
                    
                    helpLinks[1][1] = "/Help/";
                    helpLinks[1][2] = "Need Help?";
                    helpLinks[2][1] = "/Help/How-To.cfm";
                    helpLinks[2][2] = "How To";
					helpLinks[3][1] = "/Help/Frequently-Asked-Questions.cfm";
                    helpLinks[3][2] = "FAQs";
                    helpLinks[4][1] = "/Help/Feedback.cfm";
                    helpLinks[4][2] = "Feedback";
                    helpLinks[5][1] = "/Help/Web-Browser.cfm";
                    helpLinks[5][2] = "Web Browser";
                    helpLinks[6][1] = "/Help/Contact-Us.cfm";
                    helpLinks[6][2] = "Contact Us";		
                    helpLinks[7][1] = "/Help/Site-Map.cfm";
                    helpLinks[7][2] = "Site Map";
					helpLinks[8][1] = "/box.cfm";
					helpLinks[8][2] = "Box";
                                        
                </cfscript>
               		
                    <div id="myMenu-Search">
                    
                    <cfform name="frm_login"
                        method="POST" 
                        action="processLogin.cfm">
                        
                        <cfinput name="j_username" 
                            type="text" 
                            value="" 
                            placeholder="Search"
                            maxlength="50" />
                    
                    </cfform>
                    
                    </div>
                    
                <cfloop index="i" from="1" to="#arraylen(helpLinks)#">
                	
                    <cfoutput>
                    
                    	<a href="#helpLinks[i][1]#">#helpLinks[i][2]#</a>
					
                    </cfoutput>
                    
                </cfloop>
                                        
            </div>


            <input type="checkbox" name="toggleMenu2" id="toggleMenu2" style="display:none" />
            
            <div id="myMenu">
               		
                    <div id="myMenu-Search">
                    
                    <cfform name="frm_login"
                        method="POST" 
                        action="processLogin.cfm">
                        
                        <cfinput name="j_username" 
                            type="text" 
                            value="" 
                            placeholder="Search"
                            maxlength="50" />
                    
                    </cfform>
                    
                    </div>
                	
                    <div id="layout-0-50-50">
                    	
                        <div style="border:1px solid #764287;height:240px;">
                        
                            <img src="/Images/Feedback.jpg" alt="Help" width="100%" height="100%" class="boxShadow1" />
                           
                        </div>
                        
                    </div>

				<cfoutput>
                                  
                    <div id="layout-0-50-50">
                    
					<cfif isDefined("REQUEST.acctNum")>
                        
                        <a href="/Account/My-Account.cfm">My Account</a> 
                        <a href="/Account/My-Emails.cfm">My Emails</a>
                        <a href="/Account/My-Phones.cfm">My Phones</a>
                        <a href="/Account/My-Addresses.cfm">My Addresses</a>
                        <a href="/Account/My-Wallet.cfm">My Wallet</a> 
                        <a href="/Login/index.cfm?logout=1">Logout</a>
                    
                    <cfelse>
                        
                        <a href="/Account/My-Account.cfm">My Account</a> 
                        <a href="/Login/">Login</a>
                        <a href="/Signup/">Signup</a> 
                        <a href="/Login/Reset-Password.cfm">Forgot Password?</a> 
                    
                    </cfif>
                	
                    </div>
                    
                </cfoutput>
                                        
            </div>
                     
        </div>
        
<cfelse></cfif>
 
<!-- Content goes here -->

<!-- End shell -->

<cfif THISTAG.EXECUTIONMODE eq "end">

    <!-- Footer -->
            
        <div id="myFooter">
        
            Copyright &copy; <cfoutput>#REQUEST.YYYY#</cfoutput>. All Rights Reserved. 
            
        </div>
                
	</body></html>

<cfelse>

</cfif>