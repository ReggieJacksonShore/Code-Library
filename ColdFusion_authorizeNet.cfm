<cfsilent>

<!-- Create a post to merchant gateway and retrieve the results -->
	
    <!-- Merchant Account Information -->
    	
        <!-- Sandbox account -->
        
    <cfparam name="ATTRIBUTES.myLogin" default="" type="string" />
    <cfparam name="ATTRIBUTES.myTranKey" default="" type="string" />

       <!-- How the cardholder interacts with a merchant. 0 for e-commerce -->
        
    <cfparam name="ATTRIBUTES.myMarketType" default="0" type="numeric" />
 
   	<cfparam name="ATTRIBUTES.myMethod" default="CC" type="string" />
    <cfparam name="ATTRIBUTES.myType" default="AUTH_CAPTURE" type="string" />
  
    <cfparam name="ATTRIBUTES.myDelimData" default="1" type="boolean" />
    <cfparam name="ATTRIBUTES.myDelimChar" default="," type="string" />
    <cfparam name="ATTRIBUTES.myEncapsulateChar" default='"' type="string" />

    <cfparam name="ATTRIBUTES.myTestRequest" default="1" type="boolean" />

    	<!-- Set to 2. The 0 and 1 values are now deprecated. -->
    
    <cfparam name="ATTRIBUTES.myResponseFormat" default="2" type="boolean" />
    
    	<!-- Used for SIM applications. Set it to false if you are using AIM. -->
    
    <cfparam name="ATTRIBUTES.myRelayResponse" default="0" type="boolean" />
            
        <!-- 
            The period of time after the submission of a transaction during which 
            a duplicate transaction cannot be submitted. Payment gateway defaults to 2 minutes. -->
            
    <cfparam name="ATTRIBUTES.myDuplicateWindow" default="120" type="boolean" />
    <cfparam name="ATTRIBUTES.myVersion" default="3.1" type="numeric" />
  
    <!-- Card and Order Information -->
    	
        <!-- Total amount, must include tax, shipping, any other charges -->
        
    <cfparam name="ATTRIBUTES.myAmount" default="1.00" type="numeric" />
    <cfparam name="ATTRIBUTES.myCardNumber" default="4222222222222" type="string" />
    <cfparam name="ATTRIBUTES.myCardCode" default="" type="string" />
    <cfparam name="ATTRIBUTES.myExpDate" default="042001" type="string" />
	
    <cfparam name="ATTRIBUTES.myCurrency" default="USD" type="string" />
    		
        <!-- Must be created dynamically on the merchant server or provider per transaction -->
        
    <cfparam name="ATTRIBUTES.myInvoiceNumber" default="00000000000000000001" type="string" />
    <cfparam name="ATTRIBUTES.myDescription" default="Sample transaction" type="string" />
    		
    	<!-- Itemized order information -->
		
        <!-- 
        	ID and Name 31 char, Description 255 char, Quantity, 
        	Price excluding tax, freight and duty and Taxable boolean
            
            ( i.e. ID<|>Name<|>Description<|>Quantity<|>Price<|>Taxable ) -->
    
    <cfparam name="ATTRIBUTES.myLineItem" default="" type="string" />
    
    <!-- Customer information -->
    
	<cfparam name="ATTRIBUTES.myCustomerID" default="00000000000000000001" type="string" />
    <cfparam name="ATTRIBUTES.myCustomerIP" default="255.255.255.255" type="string" />
    <cfparam name="ATTRIBUTES.myFirstName" default="John" type="string" />
    <cfparam name="ATTRIBUTES.myLastName" default="Doe" type="string" />
    <cfparam name="ATTRIBUTES.myAddress" default="" type="string" />
    <cfparam name="ATTRIBUTES.myCity" default="" type="string" />
    <cfparam name="ATTRIBUTES.myState" default="" type="string" />
    <cfparam name="ATTRIBUTES.myZip" default="" type="string" />   
	
    <cfparam name="ATTRIBUTES.myCountry" default="" type="string" />
    <cfparam name="ATTRIBUTES.myEmail" default="" type="string" />
    <cfparam name="ATTRIBUTES.myEmailCustomer" default="0" type="boolean" />
    <cfparam name="ATTRIBUTES.myFax" default="" type="string" />
    <cfparam name="ATTRIBUTES.myPhone" default="" type="string" />

	<cfparam name="ATTRIBUTES.myCompany" default="" type="string" />
        
        <!-- Tran ID Required only for CREDIT, PRIOR_AUTH_CAPTURE, and VOID transactions -->    	
        <!-- Can also submit custom field:value pairs -->
    
<cflock type="EXCLUSIVE" scope="APPLICATION" timeout="20">

    <cfhttp method="Post" url="{TEST AUTHORIZE GATEWAY}">
    
        <cfhttpparam type="Formfield" name="x_login" value="">
        <cfhttpparam type="Formfield" name="x_tran_key" value="">
		<cfhttpparam type="Formfield" name="x_market_type" value="">
        <cfhttpparam type="Formfield" name="x_method" value="">
        <cfhttpparam type="Formfield" name="x_type" value="">
        <cfhttpparam type="Formfield" name="x_delim_data" value="">                     
        <cfhttpparam type="Formfield" name="x_delim_char" value="">
        <cfhttpparam type="Formfield" name="x_encap_char" value="">
        <cfhttpparam type="Formfield" name="x_test_request" value="">
       	<cfhttpparam type="Formfield" name="x_relay_format" value="">
        <cfhttpparam type="Formfield" name="x_relay_response" value="">
        <cfhttpparam type="Formfield" name="x_duplicate_window" value="">
        <cfhttpparam type="Formfield" name="x_version" value="">
        <cfhttpparam type="Formfield" name="x_amount" value="">
        <cfhttpparam type="Formfield" name="x_card_num" value="">
        <cfhttpparam type="Formfield" name="x_card_code" value="">
        <cfhttpparam type="Formfield" name="x_exp_date" value="">
        <cfhttpparam type="Formfield" name="x_currency_code" value="">
        <cfhttpparam type="Formfield" name="x_invoice_num" value="">
        <cfhttpparam type="Formfield" name="x_description" value="">
        <cfhttpparam type="Formfield" name="x_line_item" value="">
        <cfhttpparam type="Formfield" name="x_cust_id" value="">
        <cfhttpparam type="Formfield" name="x_customer_ip" value="">
        <cfhttpparam type="Formfield" name="x_first_name" value="">
        <cfhttpparam type="Formfield" name="x_last_name" value="">
        <cfhttpparam type="Formfield" name="x_address" value="">
        <cfhttpparam type="Formfield" name="x_city" value="">
        <cfhttpparam type="Formfield" name="x_state" value="">
        <cfhttpparam type="Formfield" name="x_zip" value="">
        <cfhttpparam type="Formfield" name="x_country" value="">
        <cfhttpparam type="Formfield" name="x_email" value="">
        <cfhttpparam type="Formfield" name="x_email_customer" value="">
		<cfhttpparam type="Formfield" name="x_fax" value="">
        <cfhttpparam type="Formfield" name="x_phone" value="">
        <cfhttpparam type="Formfield" name="x_company" value="">
        
    </cfhttp>

</cflock>
    
    <!-- 
        Because coldfusion's ListToArray object ignores empty fields, we must
        put a space in all empty fields to make sure that they are not skipped -->
    
        <cfset post_response = Replace(cfhttp.filecontent,",,",", ,", "all") />
    
    <!-- 
        The same command is run twice, because the first time it only adjusts
        every other empty field -->
    
        <cfset post_response = Replace(post_response,",,",", ,", "all") />
    
    
    <!-- Now the ListToArray method can be used without skipping fields -->
        
        <cfset response_array = ListToArray(post_response, ",") />

</cfsilent>
    
<!-- The results -->

<cfoutput>
    
    <cfloop index="i" from="1" to="#arrayLen(response_array)#">
    
        #response_array[i]#
    
    </cfloop>
    
    <!--
        Response_array[1] would return the Response Code
        Response_array[3] would return the Response Reason Code
        For a list of response fields, please review the AIM Implementation Guide -->

</cfoutput>