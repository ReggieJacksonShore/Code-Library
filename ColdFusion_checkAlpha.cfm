<!-- Check if field is valid alpha -->

    <cfparam name="ATTRIBUTES.checkField" default="" type="string" />
    <cfparam name="ATTRIBUTES.r_bFlag" default="0" type="boolean" />
    
    <cfparam name="charactersOK" default="" />
    
    <cfset checkFlag = 0 />

<!-- Assign ATTRIBUTE scope to VARIABLES scope -->

	<cfset checkField = ATTRIBUTES.checkField />
    
<!-- Check if field is long enough -->

	<cfif LEN(checkField) lt 3>
        
        <cfset checkFlag = 1 />
        
    <cfelse></cfif>

	<cfset l_goodChars="a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z" />
    <cfset l_goodChars = l_goodChars & ",A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" />

<!-- Extract all characters that are in this set -->
	
	<cfset charactersOK = spanIncluding(checkField,l_goodChars) />

	<cfif Len(checkField) eq Len(charactersOK)>
    
    <cfelse>
    
        <cfset checkFlag = 1 />
        
    </cfif>

<!-- Assign variable back to the CALLER scope -->

	<cfset SetVariable("Caller.r_bFlag",checkFlag) />