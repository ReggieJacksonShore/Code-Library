<cffunction name="computeDecrypt" access="public" returntype="String">

    <cfargument name="mySecret" default="" type="string" />
    <cfargument name="myKey" default="" type="string" />
    <cfargument name="algorithm" default="AES/CBC/PKCS5Padding" type="string" required="false" />
    
    <cfscript>
    
		var decrypted = '';
		
		decrypted = decrypt(mySecret,myKey,arguments.algorithm,"hex");

		return decrypted;
    
    </cfscript>

</cffunction>

<cffunction name="computeEncrypt" access="public" returntype="String">

    <cfargument name="mySecret" default="" type="string" />
    <cfargument name="myKey" default="" type="string" />
    <cfargument name="algorithm" default="AES/CBC/PKCS5Padding" type="string" required="false" />
    
    <cfscript>
    
		var encrypted = '';
		
		encrypted = encrypt(mySecret,myKey,arguments.algorithm,"hex");

		return encrypted;
    
    </cfscript>

</cffunction>

<cffunction name="genKey" access="public" returnType="string">

    <cfargument name="algorithm" default="AES" type="string" required="false" />
    
    <cfscript>
		
		  var bytes = '';
		
		  // Coldfusion will automtically create an appropriate Initialization Vector
		
		  var bytes = generateSecretKey(arguments.algorithm);
    	
      return bytes;
				
    </cfscript>

</cffunction>

<cffunction name="computeHash" access="public" returntype="String">

    <cfargument name="myPassword" default="" type="string" />
    <cfargument name="salt" default="" type="string" />
    <cfargument name="iterations" type="numeric" required="false" default="1024" />
    <cfargument name="algorithm" type="string" required="false" default="SHA-512" />
    
    <cfscript>
    
		var hashed = '';
		var i = 1;
		hashed = hash( myPassword & salt,arguments.algorithm,'UTF-8');
		for (i = 1; i <= iterations; i++) {
		  hashed = hash( hashed & salt,arguments.algorithm,'UTF-8');
		}
		return hashed;
    
    </cfscript>

</cffunction>

<cffunction name="genSalt" access="public" returnType="string">

    <cfargument name="size" type="numeric" required="false" default="16" />
    
    <cfscript>
		
		 var byteType = createObject('java', 'java.lang.Byte').TYPE;
		 var bytes = createObject('java', 'java.lang.reflect.Array').newInstance(byteType,size);
		 var rand = createObject('java', 'java.security.SecureRandom').nextBytes(bytes);
		 return toBase64(bytes);
    
    </cfscript>

</cffunction>