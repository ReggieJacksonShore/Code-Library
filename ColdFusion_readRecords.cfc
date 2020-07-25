<cfcomponent output="no" hint="Data">
                
	<!-- This function retrieves data -->
   
    <cffunction name="" hint="Data" returntype="query" access="public">
        
        <cfquery 
            name="" 
            datasource="" 
            cachedwithin="#createTimespan(1,0,0,0)#" 
            maxrows="200">
        
            SELECT	LIBRARY.TABLE_1.COLUMN_1
                        ,LIBRARY.TABLE_1.COLUMN_2
                        ,LIBRARY.TABLE_1.COLUMN_3
                        ,LIBRARY.TABLE_1.COLUMN_4
                        ,LIBRARY.TABLE_1.COLUMN_5
            
            FROM 	LIBRARY.TABLE_1
            
            LEFT JOIN TABLE_2 on ( LIBRARY.TABLE_1.COLUMN_1 = LIBRARY.TABLE_2.COLUMN_1 )
                                 
            WHERE 1=1
                
                AND LIBRARY.TABLE_1.COLUMN_1 = '' 
                AND LIBRARY.TABLE_1.COLUMN_2 = '' 
                AND LIBRARY.TABLE_1.COLUMN_4 = '' 
                AND LIBRARY.TABLE_1.COLUMN_5 = '' 
            
            ORDER BY LIBRARY.TABLE_1.COLUMN_1 ASC
        
        </cfquery>
        
        <cfreturn {QUERY OBJECT}>

    </cffunction>

</cfcomponent>