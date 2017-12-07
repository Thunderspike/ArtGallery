<cfcomponent>
<cffunction name="addToCart" access="remote">
	<cfargument name="itemID" type="string" required="yes">
	<cfif ArrayFind(session.cart, itemID) eq 0>
		<cfset ArrayAppend(session.cart, itemID)>
	</cfif>
</cffunction>
<cffunction name="removeFromCart" access="remote" returntype="string">
	<cfargument name="itemID" type="string" required="yes">
	<cfset ArrayDeleteAt(session.cart, ArrayFind(session.cart, itemID))>
</cffunction>
<cffunction name="clearCart" access="remote">
	<cfset ArrayClear(session.cart)>
</cffunction>
<cffunction name="getCart" access="remote" returntype="any" returnformat="plain">
	<cfif ArrayLen(session.cart) eq 0>
		<cfreturn "[]">
	</cfif>
	<cfquery name="retrieveContents" datasource="artgallery">
			SELECT * FROM art where ID in (#ArrayToList(session.cart)#)
		</cfquery>
	<cfreturn SerializeJSON(application.utils.QueryToArray(retrieveContents))>
</cffunction>
<cffunction name="processOrder" access="remote" returntype="any" returnformat="plain">
	<cfset myCart = {}>
	<cfset myCart.cart = DeserializeJSON(getCart())>
	<cfset myCart.Total = 0>
	
	<cfset total = 0/>
	<cfloop array="#MyCart.Cart#" index="i">
		<cfset total += i.PRICE/> 
	</cfloop>
	
	<!---<cfset CreateObject('artgallery.cfc.logErrs').logErrs(myCart.Cart[ArrayLen(myCart.Cart)])/>--->
	
	
	<cftransaction>
	<cfquery name="addOrder" datasource="artGallery" result="a">
		INSERT INTO [dbo].[Order]
           ([UserID]
           ,[dateTime]
           ,[total])
     VALUES
           ('#session.auth#'
           ,#CreateODBCDateTime(now())#
           ,#total#)
	</cfquery>
	
		<cfquery name="addOrderItems" datasource="artGallery">
			INSERT INTO [dbo].[OrderItems]
           ([OrderID]
           ,[artID])
     VALUES
			<cfloop from="1" to="#ArrayLen(myCart.Cart)#" index="i">
			   (#a.IDENTITYCOL#
			   ,#myCart.Cart[i].ID#)
			   	<cfif i neq ArrayLen(myCart.Cart)>
				,
				</cfif>
			 </cfloop>
		</cfquery>
	</cftransaction>
	
	<cfmail server="smtp.gmail.com" port="587" useTLS="yes" username="polajazi@gmail.com" password="Labellacc2458ll1234" to="#session.AUTH#" from="sales@artgallery.com" subject="Your order is being proccessed" >
		Hi #session.user.FirstName# #session.user.LastName#.
		
		Your order is currently being proccessed. You will receive another email once your order has shipped. 
		<cfoutput>
		Order ID: #a.IDENTITYCOL#
		<cfloop array="#MyCart.Cart#" index="i"><cfset total += i.PRICE/> 
			NAME : #i.NAME# | CATEGORY : #i.CATEGORY# | DIMENSIONS : #i.DIMENSIONS# : PRICE  #i.PRICE#
		</cfloop>
		
		ORDER TOTAL = #TOTAL#
		
		Shipping Address: 
		
			Street1 : #form.street1#
			Street2 : #form.street2#
			City : #form.City#
			State : #form.State#
			Zip : #form.Zipcode#
				
		</cfoutput>
	</cfmail>
	<cfset clearCart()>
	<cfset CreateObject('artgallery.cfc.logErrs').logErrs(form)/>
	<cfreturn '{"status": "sucess", "message": "Yayyyyy ... :)	 "}'>
</cffunction>
</cfcomponent>