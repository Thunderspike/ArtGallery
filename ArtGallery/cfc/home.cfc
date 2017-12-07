<cfcomponent>
	<cffunction name="GetArt" access="public" returntype="query">
		<cfargument name="Artists_ID" type="string" required="YES">
		<cfargument name="artAvailability" type="string" required="yes">
		<cfargument name="name" type="string" required="yes">
		
		<cfquery name="artsDisplay" datasource="artgallery">
			SELECT art.ID as ID, art.Image as artImage, art.Name as artName, artists.FirstName as artistFname, artists.LastName as artistLname, art.Category as artCategory, art.Dimensions as artDimensions, art.Date as artDate, art.Availability as artAvailability, art.Artists_ID as ArtistID
			from Art art
			inner join Artists artists on art.Artists_ID = artists.ID
			<cfif arguments.Artists_ID neq "">
				And art.Artists_ID = #arguments.Artists_ID#
			</cfif>
			<cfif arguments.artAvailability neq "">
				And art.artAvailability = #arguments.artAvailability#
			</cfif>
			<cfif arguments.name neq "">
				And art.Name like '%#arguments.Name#%'
			</cfif>
		</cfquery>
		<cfreturn artsDisplay/>
	</cffunction>
	<cffunction name="getArtists" returntype="query" access="public">
		<cfquery name="Artists" datasource="artGallery">
			Select * from Artists
		</cfquery>
		<cfreturn Artists/>
	</cffunction>
</cfcomponent>