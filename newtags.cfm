<cfset thisString= structNew()>
<cfset structAppend(thisString, 'ali') />
<cfset structAppend(thisString, 'ali') />
<cfset structAppend(thisString, 'ali') />
<cfset structAppend(thisString, 'ali') />
<cfset structAppend(thisString, 'ali') />

 <script type="text/javascript" language="JavaScript"> 
 <cfoutput> 
 var #toScript(thisString, "jsVar")#; 
 </cfoutput>
 alert(jsVar); 
 </script>