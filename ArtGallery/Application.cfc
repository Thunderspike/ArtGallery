<cfcomponent>
<cfset this.name = "ArtGallery">
<!---<cfset this.datasource = "Capstone">--->
<cfset this.sessionManagement = "true">
<cffunction name="onApplicationStart">
	<cfset application.utils = CreateObject('cfc.util')/>
</cffunction>
<cffunction name="onSessionStart">
	<cfset session.cart = ArrayNew(1)>
	<cfset session.AUTH = "">
	<cfset session.tokenfield = ''/>
	<cfset session.afterloginsuccess = ''/>
	<cfset session.usertype = ""/>
	<cfset session.user = ""/>
</cffunction>
<cffunction name="onRequestStart">
	<!---<cfset onSessionStart()>---> 
	<!---<cfset onApplicationStart()>--->
	<cfif ListFind(cgi.SCRIPT_NAME, 'admin', '/')>
		<cfif session.AUTH eq "" or session.usertype neq 1>
			<cflocation url="./ArtGallery/login.cfm" addtoken="no"/><cfabort/>
		</cfif>
	</cfif>
</cffunction>
<cffunction name="onError">
	<cfargument name="Exception" required=true/>
	<!--- Log all errors. --->
	<cfset CreateObject('artgallery.cfc.logErrs').logErrs(Exception	)/>
</cffunction>
</cfcomponent>
