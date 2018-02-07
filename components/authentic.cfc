<!-- auth component -->
<cfcomponent output="false">

	<!-- this is the validate user method -->
	<cffunction name="validateuser" access="public" returntype="array">
		<cfargument name="useremail" type="string" required="true" >
			<cfargument name="userpassword" required="true">
				<cfset var  aErrormessages = arrayNew(1) />
					<cfif NOT isValid(email, arguments.useremail)>	
						<cfset arrayAppend(aErrormessages, 'Please Provide a valid email')>
							</cfif>
								<cfif #arguments.userpassword# neq ''>
									<cfset arrayAppend(aErrormessages, 'Please Provide a  password')>
										</cfif>

	<cfreturn aErrormessages>
	</cffunction>
				<!-- this is the do login method -->
	<cffunction name="doLogin" returntype="boolean">
		<cfargument name="useremail" type="string" required="true" >
			<cfargument name="userpassword" required="true">
				<cfset isUser = false />
					<cfquery name="rsloginuser">
						SELECT * from users
						where email = '#arguments.useremail#'
						and userpassword = '#arguments.userpassword#'
						and activated = 1
						</cfquery>
							<cfif #rsloginuser.recordcount# eq 1>
								<cflogin>
									<cfloginuser name="#rsloginuser.firstname#" password="#rsloginuser.userpassword#" roles="user">
										</cflogin>
											<Cfset session.loggedUser = {'userfirstname' = '#rsloginuser.firstname#', 'userid' = '#rsloginuser.usersid#' } />
												<cfset isUser = true />
													</cfif>
	<cfreturn isUser/>
	</cffunction>
				<!-- do logout method -->
	<cffunction name="dologout" returntype="void">
						<cfset structDelete(session, 'loggedUser') />
							<cflogout />

	</cffunction>
</cfcomponent>