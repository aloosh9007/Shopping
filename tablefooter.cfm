								<cfif structKeyExists(session, 'shoppingcart')>
								<cfset total = application.cart.cartTotal() />
										<tr>
										<th class="empty" colspan="3"></th>
										<th>New SUBTOTAL</th>
										<th colspan="2" class="sub-total"><cfoutput>$#total#</cfoutput></th>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>SHIPING</th>
										<td colspan="2">Free Shipping</td>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>TAX</th>
										<td colspan="2">%8.7</td>
									</tr>
									<tr>
										<th class="empty" colspan="3"></th>
										<th>TOTAL</th>
											<cfset final = round(total * 1.087) & .00 />
										<th colspan="2" class="total"><cfoutput>$#final#</cfoutput></th>
									</tr>
								
							</cfif>