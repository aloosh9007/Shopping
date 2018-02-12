<!--- authentiacte --->
<cfif isDefined('url.register')>
		<cfset authenticate = createObject('component','Shopping.components.authentic') />

		<cfif NOT isDefined('url.newsletter')><cfset url.newsletter = 0></cfif>
		<cfif NOT isDefined('url.sales')><cfset url.sales = 0></cfif>
		<cfset authenticate.resgisteruser('#URL.firstname#','#URL.newpassword#','#URL.street#','#URL.city#','#URL.state#','#URL.zip#','#URL.Cphone#','#URL.email#',#url.newsletter#, #url.sales#) />
	</cfif>
<cfif isDefined('log')>
<cfset authenticate = createObject('component','Shopping.components.authentic') />
<cfset authenticate.doLogin('#url.email#','#url.key#') />
</cfif>
