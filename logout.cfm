<cfset authenticate = createObject('component','Shopping.components.authentic') />
		<cfset authenticate.dologout() />
		<cflocation url="index.cfm" />