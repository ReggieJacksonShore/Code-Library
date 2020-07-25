<!-- Check field is alpha -->

<cfparam name="ATTRIBUTES.checkField" default="" type="string" />
<cfparam name="ATTRIBUTES.r_bFlag" default="0" type="boolean" />

<cfparam name="charactersOK" default="" />

<cfset checkPass = 0 />

<!-- assign ATTRIBUTE scope to VARIABLES scope -->

	<cfset checkField = ATTRIBUTES.checkField />

	<cfset l_goodChars="a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z" />
    <cfset l_goodChars = l_goodChars & ",A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" />
    <cfset l_goodChars = l_goodChars & ",0,1,2,3,4,5,6,7,8,9" />

<!-- extract all characters that are in this set -->
	
	<cfset charactersOK = spanIncluding(checkField,l_goodChars) />

<cfif Len(checkField) eq Len(charactersOK)>

	<cfset checkPass = 1 />

<cfelse>

	<cfset checkPass = 0 />

</cfif>

<!-- Assign variable back to the CALLER scope -->

	<cfset SetVariable("Caller.r_bFlag", checkPass) />