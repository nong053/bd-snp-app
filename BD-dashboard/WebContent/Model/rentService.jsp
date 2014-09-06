<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="connectionPackage.*"%>
<%
	connectionPackage.connectionJNDI jndi = new connectionPackage.connectionJNDI();
	//GET PARAMETER START
	String paramRequest = request.getParameter("paramRequest");
	String paramCountry = request.getParameter("paramCountry");
	
	String paramRegion = request.getParameter("paramRegion");
	String paramProvince = request.getParameter("paramProvince");
	String paramArea = request.getParameter("paramArea");
	String paramBranch = request.getParameter("paramBranch");
	String paramBrand = request.getParameter("paramBrand");
	

	
	String paramSort = request.getParameter("paramSort");
	String paramLocationTypeName = request.getParameter("paramLocationTypeName");
	String paramYear = request.getParameter("paramYear");
	String paramMonthFrom = request.getParameter("paramMonthFrom");
	String paramMonthTo = request.getParameter("paramMonthTo");
	String paramLocationTypeList = request.getParameter("paramLocationTypeList");
	

	/*
	out.println("paramSort11"+paramSort);
	out.println("paramLocationTypeName"+paramLocationTypeName);
	out.println("paramYear"+paramYear);
	out.println("paramMonthFrom"+paramMonthFrom);
	out.println("paramMonthTo"+paramMonthTo);
	out.println("paramLocationTypeList"+paramLocationTypeList);
	
	*/

	
	//GET PARAMETER END
%>
<%
//DEFAULT PARAMATER 
	//location Type Start
	if(paramRequest.equals("listLocationType")){
		
		jndi.listLocationType("CALL ParameterLocationType('"+paramCountry+"')");
		out.println(jndi.getLocationTypeHTML());
		
	/*
	String queryLocationType="CALL ParameterLocationType('"+paramCountry+"')";
	String locationTypeHTML="";
	rs=mysqlConn.selectData(queryLocationType);
		locationTypeHTML+="<ul>";
		int i=0;
	while(rs.next()){
		locationTypeHTML+="<li>";
		locationTypeHTML+="<a href=\"#\" class=\"listLocationType\" id=\"locationTypeId"+i+"\">";
		locationTypeHTML+=rs.getString(1);
		locationTypeHTML+="</li>";
		i++;
	}
	conn.close();
	locationTypeHTML+="</ul>";
	out.println(locationTypeHTML);
	*/
	
	//location Type End
	}

	//LandlordGroup Start
	if(paramRequest.equals("listLandlordGroup")){
		jndi.listLandlordGroup("CALL ParameterLandlordGroup('"+paramCountry+"')");
		out.println(jndi.getLandlordGroupHTML());
	/*
	String queryLandlordGroup="CALL ParameterLandlordGroup('"+paramCountry+"')";
	String LandlordGroupHTML="";
	rs=mysqlConn.selectData(queryLandlordGroup);
	LandlordGroupHTML+="<ul>";
		int i=0;
	while(rs.next()){
		LandlordGroupHTML+="<li>";
		LandlordGroupHTML+="<a href=\"#\" class=\"listLandlordGroup\" id=\"landlordGroupId"+i+"\">";
		LandlordGroupHTML+=rs.getString(1);
		LandlordGroupHTML+="</li>";
		i++;
	};
	conn.close();
	LandlordGroupHTML+="</ul>";
	out.println(LandlordGroupHTML);
	*/
	//LandlordGroup End
	}
	
	//listBrand Start
	if(paramRequest.equals("listBrand")){
		jndi.listBrand("CALL ParameterBrand('"+paramCountry+"')");
		out.println(jndi.getBrandHTML());
	/*
	String queryBrand="CALL ParameterBrand('"+paramCountry+"')";
	String BrandHTML="";
	rs=mysqlConn.selectData(queryBrand);
	BrandHTML+="<ul>";
		int i=0;
	while(rs.next()){
		BrandHTML+="<li>";
		BrandHTML+="<a href=\"#\" class=\"listBrand\" id=\"brandId"+i+"\">";
		BrandHTML+=rs.getString(1);
		BrandHTML+="</li>";
		i++;
	};
	conn.close();
	BrandHTML+="</ul>";
	out.println(BrandHTML);

	*/
	}
	//listBrand End
	
	//listRegion Start
	if(paramRequest.equals("listRegion")){
		jndi.listRegion("CALL ParameterRegion('"+paramCountry+"')");
		out.println(jndi.getRegionHTML());
		/*
	String queryRegion="CALL ParameterRegion('"+paramCountry+"')";
	String RegionHTML="";
	rs=mysqlConn.selectData(queryRegion);
	RegionHTML+="<ul>";
		int i=0;
	while(rs.next()){
		RegionHTML+="<li>";
		RegionHTML+="<a href=\"#\" class=\"listRegion\" id=\"regionId"+i+"\">";
		RegionHTML+=rs.getString(1);
		RegionHTML+="</li>";
		i++;
	};
	conn.close();
	RegionHTML+="</ul>";
	out.println(RegionHTML);
		*/
	}
	//listRegion End
	
	//listProvince Start
	if(paramRequest.equals("listProvince")){
		jndi.listProvince("CALL ParameterProvince('"+paramRegion+"','"+paramCountry+"')");
		out.println(jndi.getProvinceHTML());
		/*
	String queryProvince="CALL ParameterProvince('"+paramRegion+"','"+paramCountry+"')";
	String ProvinceHTML="";
	rs=mysqlConn.selectData(queryProvince);
	ProvinceHTML+="<ul>";
		int i=0;
	while(rs.next()){
		ProvinceHTML+="<li>";
		ProvinceHTML+="<a href=\"#\" class=\"listProvince\" id=\"provinceId"+i+"\">";
		ProvinceHTML+=rs.getString(1);
		ProvinceHTML+="</li>";
		i++;
	};
	conn.close();
	ProvinceHTML+="</ul>";
	out.println(ProvinceHTML);
	*/
	}
	//listProvince End
	
	
	//listArea Start
	if(paramRequest.equals("listArea")){
		jndi.listArea("CALL ParameterArea('"+paramCountry+"')");
		out.println(jndi.getAreaHTML());
		
		/*
	String queryArea="CALL ParameterArea('"+paramCountry+"')";
	String AreaHTML="";
	rs=mysqlConn.selectData(queryArea);
	AreaHTML+="<ul>";
		int i=0;
	while(rs.next()){
		AreaHTML+="<li>";
		AreaHTML+="<a href=\"#\" class=\"listArea\" id=\"areaId"+i+"\">";
		AreaHTML+=rs.getString(1);
		AreaHTML+="</li>";
		i++;
	};
	conn.close();
	AreaHTML+="</ul>";
	out.println(AreaHTML);
	*/
	}
	//listArea End
	
	//listFormat Start
	if(paramRequest.equals("listFormat")){
		jndi.listFormat("CALL ParameterFormat('"+paramCountry+"')");
		out.println(jndi.getFormatHTML());
		/*
	String queryFormat="CALL ParameterFormat('"+paramCountry+"')";
	String FormatHTML="";
	rs=mysqlConn.selectData(queryFormat);
	FormatHTML+="<ul>";
		int i=0;
	while(rs.next()){
		FormatHTML+="<li>";
		FormatHTML+="<a href=\"#\" class=\"listFormat\" id=\"formatId"+i+"\">";
		FormatHTML+=rs.getString(1);
		FormatHTML+="</li>";
		i++;
	};
	conn.close();
	FormatHTML+="</ul>";
	out.println(FormatHTML);
		*/
	}
	//listFormat End
	
	
	
	//NotSparkLine Start
	if(paramRequest.equals("paramExpiring")){
		
	/*
 	String query2="'"+paramRegion+"','"+paramProvince+"','"+paramArea+"'";
  	String query3="'"+paramRegion+"','"+paramProvince+"','"+paramArea+"'";
  	jndi.selectExpiring("CALL NotSparkLine('"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')",query2,query3);
  	out.println(jndi.getData());
  	*/
  	
  	
  String query2="'"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"'";
  String query3="'"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"'";
  jndi.selectExpiring("CALL NotSparkLine('"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')",query2,query3);
  out.println(jndi.getData());
    
		//'vBrand','vCountry','vRegion','vProvince','vArea'
	/*	
	String queryExpiring="CALL NotSparkLine('"+paramBrand+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
	String Expiring="";
	
	rs=mysqlConn.selectData(queryExpiring);
	
	Expiring+="";
	
	JSONArray objExpring = new JSONArray();
	while(rs.next()){
		
		JSONArray subObjExpring = new JSONArray();
		
					String[] subStringNumber;
					subStringNumber=rs.getString(1).split("-");
					
					subObjExpring.add(rs.getString(1));
					subObjExpring.add(rs.getString(2));
					subObjExpring.add(rs.getString(3));
					subObjExpring.add(rs.getString(4));
					subObjExpring.add(rs.getString(5));
					
					String sparkLineQuery="CALL SparkLineNetSalesSqM('"+subStringNumber[1]+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
					ResultSet rs2 = mysqlConn.selectData(sparkLineQuery);
					
					while(rs2.next()){
						subObjExpring.add(rs2.getString(2)+","+rs2.getString(3)+","+rs2.getString(4)+","+rs2.getString(5)+","+rs2.getString(6)+","+rs2.getString(7)+","+rs2.getString(8)+","+rs2.getString(9)+","+rs2.getString(10)+","+rs2.getString(11)+","+rs2.getString(12)+","+rs2.getString(13));
					}
					
					String sparkLine3Query="CALL SparkLineRentNetSales('"+subStringNumber[1]+"','"+paramCountry+"','"+paramRegion+"','"+paramProvince+"','"+paramArea+"')";
					ResultSet rs3 = mysqlConn.selectData(sparkLineQuery);
					
					while(rs3.next()){
						subObjExpring.add(rs3.getString(2)+","+rs3.getString(3)+","+rs3.getString(4)+","+rs3.getString(5)+","+rs3.getString(6)+","+rs3.getString(7)+","+rs3.getString(8)+","+rs3.getString(9)+","+rs3.getString(10)+","+rs3.getString(11)+","+rs3.getString(12)+","+rs3.getString(13));
					}
					
					
					
					
		//subObjExpring.add(rs2.getString(1));			
		objExpring.add(subObjExpring);
	};
	conn.close();
	out.println(objExpring);
	*/


	}
	//NotSparkLine End
	
	
	//localType Start
	
	if(paramRequest.equals("locationType")){
		if(paramSort.equals("top")){
			if(paramLocationTypeName.equals("gridRentSqM")){
				/*
					paramSort
					paramLocationTypeName
					paramYear
					paramMonthFrom
					paramMonthTo
					paramLocationTypeList
				*/
				  jndi.selectByIndex("CALL RentPerSqMTop_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				  out.println(jndi.getData());
				  /*
					String  queryRentPerSqM="CALL RentPerSqMTop_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
					rs=mysqlConn.selectData(queryRentPerSqM);
					JSONArray objData = new JSONArray();
					
					while(rs.next()){
						JSONArray subObjData = new JSONArray();
						subObjData.add(rs.getString(1));//Branch
						subObjData.add(rs.getString(2));//RentPerSqM
						objData.add(subObjData);
					}
					conn.close();
					out.print(objData);
				 */
				
				
			}else if(paramLocationTypeName.equals("gridNetSalesSqM")){
				jndi.selectByIndex("CALL NetSalesPerSqMTop_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				 out.println(jndi.getData());
				 /*
				String  queryNetSalesSqM="CALL NetSalesPerSqMTop_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}else if(paramLocationTypeName.equals("gridRentNetSales")){
				jndi.selectByIndex("CALL RentPerNetSalesTop_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				 /*
				String  queryNetSalesSqM="CALL RentPerNetSalesTop_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}else if(paramSort.equals("bottom")){
			
			if(paramLocationTypeName.equals("gridRentSqM")){
				
				jndi.selectByIndex("CALL RentPerSqMBottom_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				
				/*
				String  queryRentPerSqM="CALL RentPerSqMBottom_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
				
			}else if(paramLocationTypeName.equals("gridNetSalesSqM")){
				
				jndi.selectByIndex("CALL NetSalesPerSqMBottom_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMBottom_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
			}else if(paramLocationTypeName.equals("gridRentNetSales")){
				
				jndi.selectByIndex("CALL RentPerNetSalesBottom_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesBottom_LocationType("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}
		

	}
	//localType End
	
	//landlordGroup Start
	if(paramRequest.equals("landlordGroup")){
		if(paramSort.equals("top")){
			if(paramLocationTypeName.equals("gridLandlordGroupRentSqM")){
				jndi.selectByIndex("CALL RentPerSqMTop_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
					paramSort
					paramLocationTypeName
					paramYear
					paramMonthFrom
					paramMonthTo
					paramLocationTypeList
				*/
				/*
				String  queryRentPerSqM="CALL RentPerSqMTop_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
				
			}else if(paramLocationTypeName.equals("gridLandlordGroupNetSalesSqM")){
				jndi.selectByIndex("CALL NetSalesPerSqMTop_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMTop_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
			}else if(paramLocationTypeName.equals("gridLandlordGroupRentNetSales")){
				jndi.selectByIndex("CALL RentPerNetSalesTop_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesTop_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}else if(paramSort.equals("bottom")){
			if(paramLocationTypeName.equals("gridLandlordGroupRentSqM")){
				jndi.selectByIndex("CALL RentPerSqMBottom_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryRentPerSqM="CALL RentPerSqMBottom_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
				
			}else if(paramLocationTypeName.equals("gridLandlordGroupNetSalesSqM")){
				jndi.selectByIndex("CALL NetSalesPerSqMBottom_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMBottom_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
			}else if(paramLocationTypeName.equals("gridLandlordGroupRentNetSales")){
				
				jndi.selectByIndex("CALL RentPerNetSalesBottom_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesBottom_LandlordGroup("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}
		

	}
	//LandlordGroup End
	
	//Brand Start
	if(paramRequest.equals("Brand")){
		if(paramSort.equals("top")){
			if(paramLocationTypeName.equals("gridBrandRentSqM")){
				
			jndi.selectByIndex("CALL RentPerSqMTop_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
			out.println(jndi.getData());	
			/*
				String  queryRentPerSqM="CALL RentPerSqMTop_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				
			*/
				
			}else if(paramLocationTypeName.equals("gridBrandNetSalesSqM")){
				jndi.selectByIndex("CALL NetSalesPerSqMTop_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());	
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMTop_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
			}else if(paramLocationTypeName.equals("gridBrandRentNetSales")){
				jndi.selectByIndex("CALL RentPerNetSalesTop_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());	
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesTop_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}else if(paramSort.equals("bottom")){
			if(paramLocationTypeName.equals("gridBrandRentSqM")){
				jndi.selectByIndex("CALL RentPerSqMBottom_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryRentPerSqM="CALL RentPerSqMBottom_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
				
			}else if(paramLocationTypeName.equals("gridBrandNetSalesSqM")){
				
				jndi.selectByIndex("CALL NetSalesPerSqMBottom_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMBottom_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
			}else if(paramLocationTypeName.equals("gridBrandRentNetSales")){
				jndi.selectByIndex("CALL RentPerNetSalesBottom_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesBottom_Brand("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}
		

	}
	//Brand End
	
	
	
	//Region Start
	if(paramRequest.equals("Region")){
		if(paramSort.equals("top")){
			if(paramLocationTypeName.equals("gridRegionProvinceRentSqM")){
				
				jndi.selectByIndex("CALL RentPerSqMTop_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryRentPerSqM="CALL RentPerSqMTop_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
				
			}else if(paramLocationTypeName.equals("gridRegionProvinceNetSalesSqM")){
				jndi.selectByIndex("CALL NetSalesPerSqMTop_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMTop_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
			}else if(paramLocationTypeName.equals("gridRegionProvinceRentNetSales")){
				jndi.selectByIndex("CALL RentPerNetSalesTop_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesTop_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}else if(paramSort.equals("bottom")){
			if(paramLocationTypeName.equals("gridRegionProvinceRentSqM")){
				jndi.selectByIndex("CALL RentPerSqMBottom_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryRentPerSqM="CALL RentPerSqMBottom_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
				
			}else if(paramLocationTypeName.equals("gridRegionProvinceNetSalesSqM")){
				jndi.selectByIndex("CALL NetSalesPerSqMBottom_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMBottom_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
			}else if(paramLocationTypeName.equals("gridRegionProvinceRentNetSales")){
				jndi.selectByIndex("CALL RentPerNetSalesBottom_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesBottom_Region("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}
		

	}
	//Region End
	
	//Province Start
	if(paramRequest.equals("Province")){
		if(paramSort.equals("top")){
			if(paramLocationTypeName.equals("gridRegionProvinceRentSqM")){
				jndi.selectByIndex("CALL RentPerSqMTop_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryRentPerSqM="CALL RentPerSqMTop_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
				
			}else if(paramLocationTypeName.equals("gridRegionProvinceNetSalesSqM")){
				jndi.selectByIndex("CALL NetSalesPerSqMTop_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMTop_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}else if(paramLocationTypeName.equals("gridRegionProvinceRentNetSales")){
				jndi.selectByIndex("CALL RentPerNetSalesTop_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesTop_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}else if(paramSort.equals("bottom")){
			if(paramLocationTypeName.equals("gridRegionProvinceRentSqM")){
				jndi.selectByIndex("CALL RentPerSqMBottom_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryRentPerSqM="CALL RentPerSqMBottom_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
				
			}else if(paramLocationTypeName.equals("gridRegionProvinceNetSalesSqM")){
				jndi.selectByIndex("CALL NetSalesPerSqMBottom_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMBottom_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
			}else if(paramLocationTypeName.equals("gridRegionProvinceRentNetSales")){
				
				jndi.selectByIndex("CALL RentPerNetSalesBottom_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesBottom_Province("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}
		

	}
	//Province End
	
	//Area Start
	if(paramRequest.equals("Area")){
		if(paramSort.equals("top")){
			if(paramLocationTypeName.equals("gridAreaRentSqM")){
				jndi.selectByIndex("CALL RentPerSqMTop_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryRentPerSqM="CALL RentPerSqMTop_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				
				*/
				
			}else if(paramLocationTypeName.equals("gridAreaNetSalesSqM")){
				
				jndi.selectByIndex("CALL NetSalesPerSqMTop_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMTop_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}else if(paramLocationTypeName.equals("gridAreaRentNetSales")){
				jndi.selectByIndex("CALL RentPerNetSalesTop_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesTop_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}else if(paramSort.equals("bottom")){
			if(paramLocationTypeName.equals("gridAreaRentSqM")){
				jndi.selectByIndex("CALL RentPerSqMBottom_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryRentPerSqM="CALL RentPerSqMBottom_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
				
			}else if(paramLocationTypeName.equals("gridAreaNetSalesSqM")){
				jndi.selectByIndex("CALL NetSalesPerSqMBottom_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMBottom_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
			}else if(paramLocationTypeName.equals("gridAreaRentNetSales")){
				jndi.selectByIndex("CALL RentPerNetSalesBottom_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesBottom_Area("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}
		

	}
	//Area End
	
	//Format Start
	if(paramRequest.equals("Format")){
		if(paramSort.equals("top")){
			if(paramLocationTypeName.equals("gridFormatRentSqM")){
				jndi.selectByIndex("CALL RentPerSqMTop_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryRentPerSqM="CALL RentPerSqMTop_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
				
			}else if(paramLocationTypeName.equals("gridFormatSalesSqM")){
				jndi.selectByIndex("CALL NetSalesPerSqMTop_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMTop_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}else if(paramLocationTypeName.equals("gridFormatRentNetSales")){
				jndi.selectByIndex("CALL RentPerNetSalesTop_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesTop_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}else if(paramSort.equals("bottom")){
			if(paramLocationTypeName.equals("gridFormatRentSqM")){
				jndi.selectByIndex("CALL RentPerSqMBottom_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryRentPerSqM="CALL RentPerSqMBottom_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryRentPerSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//Branch
					subObjData.add(rs.getString(2));//RentPerSqM
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
				
			}else if(paramLocationTypeName.equals("gridFormatSalesSqM")){
				jndi.selectByIndex("CALL NetSalesPerSqMBottom_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL NetSalesPerSqMBottom_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
				
			}else if(paramLocationTypeName.equals("gridFormatRentNetSales")){
				jndi.selectByIndex("CALL RentPerNetSalesBottom_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')","1,2");
				out.println(jndi.getData());
				/*
				String  queryNetSalesSqM="CALL RentPerNetSalesBottom_Format("+paramYear+","+paramMonthFrom+","+paramMonthTo+",'"+paramLocationTypeList+"')";
				rs=mysqlConn.selectData(queryNetSalesSqM);
				JSONArray objData = new JSONArray();
				
				while(rs.next()){
					JSONArray subObjData = new JSONArray();
					subObjData.add(rs.getString(1));//
					subObjData.add(rs.getString(2));//
					objData.add(subObjData);
				}
				conn.close();
				out.print(objData);
				*/
			}
		}
		

	}
	//Format End
	
	//SparkLineNetSalesSqM Start
	
	
	
	
%>