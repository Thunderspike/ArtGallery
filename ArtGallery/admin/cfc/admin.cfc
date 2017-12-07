<cfcomponent>
	<cffunction name="SaveArtist" access="remote" returntype="any" returnformat="plain">
		<cfargument name="FirstName" required="yes"/>
		<cfargument name="MiddleName" required="yes"/>
		<cfargument name="LastName" required="yes"/>
		<cfargument name="Country" required="yes"/>
		<cfargument name="Bio" required="yes"/>
		<cfargument name="Picture" required="yes"/>
		<cfset r = {"Status":"", "Message": ""}/>
		<cftry>
			<cffile action="upload" destination="#ExpandPath('/artgallery/imgs/artist/')#" nameconflict="makeunique" filefield="picture" result="upload" >
			<cfcatch>
				<cfset CreateObject('artgallery.cfc.logErrs').logErrs(cfcatch)/>
				<cfset r.Status = "Error"/>
				<cfset r.Message = "Can't Upload File. Try Again Later."/>
				<cfreturn SerializeJSON(r)>
			</cfcatch>
		</cftry>
		<cfset CreateObject('artgallery.cfc.logErrs').logErrs(upload)/>
		<cfquery name="insertArtist" datasource="artGallery">
			INSERT INTO [dbo].[Artists]
           ([FirstName]
           ,[MiddleName]
           ,[LastName]
           ,[Country]
           ,[Bio]
           ,[Picture])
     VALUES
           (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.FirstName#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.MiddleName#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.LastName#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Country#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Bio#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="../artist/#upload.serverFile#"/>
           )
		</cfquery>
		
		<cfset r.Status = "Success"/>
		<cfset r.Message = "Yayyyyy"/>
		<cfreturn SerializeJSON(r)>
	</cffunction>
	
	<cffunction name="SaveArt" access="remote" returntype="any" returnformat="plain">
		<cfargument name="Name" required="yes"/>
		<cfargument name="Category" required="yes"/>
		<cfargument name="Price" required="yes"/>
		<cfargument name="Artists_ID" required="yes"/>
		<cfargument name="Image" required="yes"/>
		<cfargument name="Dimensions" required="yes"/>
		<cfargument name="Date" required="yes"/>
		<cfargument name="CityPainted" required="yes"/>
		<cfset r = {"Status":"", "Message": ""}/>
		<cftry>
			<cffile action="upload" destination="#ExpandPath('/artgallery/imgs/art/')#" nameconflict="makeunique" filefield="Image" result="upload" >
			<cfcatch>
				<cfset CreateObject('artgallery.cfc.logErrs').logErrs(cfcatch)/>
				<cfset r.Status = "Error"/>
				<cfset r.Message = "Can't Upload Image. Try Again Later."/>
				<cfreturn SerializeJSON(r)>
			</cfcatch>
		</cftry>
		<cfset CreateObject('artgallery.cfc.logErrs').logErrs(upload)/>
		<cfquery name="insertArtist" datasource="artGallery">
		INSERT INTO [dbo].[Art]
           ([Name]
           ,[Category]
           ,[Price]
           ,[Availability]
           ,[Artists_ID]
           ,[Image]
           ,[Dimensions]
           ,[Date]
           ,[CityPainted])
     VALUES
           (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Name#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Category#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Price#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="1"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Artists_ID#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="../art/#upload.serverFile#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Dimensions#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Date#"/>
           ,<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.CityPainted#"/>
           )
		</cfquery>
		
		<cfset r.Status = "Success"/>
		<cfset r.Message = "Yayyyyy"/>
		<cfreturn SerializeJSON(r)>
	</cffunction>
	
	<cffunction name="getArtists"  access="remote" returntype="any" returnformat="plain">
		<cfquery name="Artists" datasource="artGallery">
			Select * from Artists
		</cfquery>
		<cfreturn SerializeJSON(application.utils.QueryToArray(Artists))/>
	</cffunction>
</cfcomponent>