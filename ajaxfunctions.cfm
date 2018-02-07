<!-- ajax page start -->
<!-- submit review -->
<cfif isDefined('url.NewReview')>
		<cfif NOT isDefined('url.rating')><cfset url.rating = 5 /></cfif>
	<cfset application.pageService.submitReview(url.itemid,url.name,url.email, url.rating, url.review) />
		</cfif>
<!-- pagination for reviews -->
<!--- pagination start --->
<cfquery name="getrecords">Select * from reviews where itemid = '#item.itemid#' </cfquery>
<cfset  resultsPerpage = 3 />
<cfset numofresults = #getrecords.recordcount# />
<cfset numberofpages = #ceiling(numofresults / resultsPerpage)# />
<cfset currentURL = listremoveduplicates(#cgi.query_string#)  />
								<cfif isDefined('url.page')>
								<cfelse>
							<cfset url.page = 1>
								</cfif>
								<cfset start = (#url.page# - 1) * #resultsPerpage# />

											<cfquery name="getreviews">
												Select * from reviews where itemid = '#item.itemid#' LIMIT #start#, #resultsPerpage#
										</cfquery>


										<cfoutput>

															<li class="active"><a data-toggle="tab" href="##tab1">Description</a></li>
								<li><a data-toggle="tab" href="##tab1">Details</a></li>
								<li><a data-toggle="tab" href="##tab2">Reviews (#getrecords.recordcount#)</a></li>
							</ul>
							<div class="tab-content">
								<div id="tab1" class="tab-pane fade in active">
									<p>#item.Description#.</p>
								</div>
							</cfoutput>
								<div id="tab2" class="tab-pane fade in">

									<div class="row">

										<div class="col-md-6">
											<div class="product-reviews">

										<cfoutput query="getreviews">
												<div class="single-review">
													<div class="review-heading">
														<div><a href="##"><i class="fa fa-user-o"></i> #name#</a></div>
														<div><a href="##"><i class="fa fa-clock-o">
															
														</i> #dateTimeFormat(created, "dd mmm yyyy hh:nn")#</a></div>
														<div class="review-rating pull-right">
									<cfif #rating# neq "">
									<cfloop from="1" to="5" index="i">
									<cfif #rating# gte #i#>
									<i class="fa fa-star"></i>
									<cfelse>
									<i class="fa fa-star-o empty"></i>
									</cfif>
									</cfloop>
									</cfif>
														</div>
													</div>
													<div class="review-body">
														<p>#review#.</p>
													</div>
												</div>
											</cfoutput>

												<ul class="reviews-pages">
													<cfloop from="1" to="#numberofpages#" index="i">
													<cfif #i# eq #url.page#>
													<cfoutput><li class="active">#i#</cfoutput></li>
													<cfelse><li>
														<cfoutput><a href="product-page.cfm?page=#i#&#currentURL#">#i#</cfoutput></a></li>
													</cfif>
													</cfloop>
													<li><a href="##"><i class="fa fa-caret-right"></i></a></li>
												</ul>
											</div>
										</div>


