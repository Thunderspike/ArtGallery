<cfcomponent>
<cffunction name="logErrs" access="public" returntype="void">
	<cfargument name="dumpVar" type="any" required="yes">
	<cfset inet = CreateObject("java", "java.net.InetAddress")>
	<cfset inet = inet.getLocalHost()>
	<cfset server_hostname = ucase(trim(inet.getHostName()))>
	<cfsavecontent variable="startline">
	<meta http-equiv="EXPIRES" content="Mon, 22 Jul 2002 11:12:01 GMT">
	<cfoutput>
	
	Time: #TimeFormat(Now(), 'hh:mm:ss')# - #DateFormat(Now(), 'mmm dd, yyyy')# <br>
	Server: #server_hostname#
	<cftry>
		<p>#dumpVar#</p>
		<cfcatch>
		</cfcatch>
	</cftry>
	</cfoutput>
	</p>
	<cfdump var="#dumpVar#">
	</p>
	</cfsavecontent>
	<cffile file="#ExpandPath('/artgallery/')#log.html" action="write" nameconflict="makeunique" output="#startline#" addnewline="yes" fixnewline="yes">
</cffunction>
</cfcomponent>
