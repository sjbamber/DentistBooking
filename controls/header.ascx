<%@ Control Language="C#" AutoEventWireup="true" CodeFile="header.ascx.cs" Inherits="controls_header" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8" />
    <title>Staina House Dental Practice</title>
    <link rel="stylesheet" type="text/css" href="~/styles/html.css" />		            <!-- Governs appearance of html elements; headings, paragraph etc. -->		
    <link rel="stylesheet" type="text/css" href="~/styles/layout.css" />		        <!-- Governs layout i.e. position of slices -->
    <link href="favicon.ico" rel="shortcut icon" />
</head>
<body>
    <div id="top_bar">
        <div id="top_bar_content">
                    <asp:HyperLink ID="topBarLink1" runat="server"></asp:HyperLink>
			        <asp:HyperLink ID="topBarLink2" runat="server"></asp:HyperLink>
			        <div class="bar_feature"><asp:Label ID="topBarLabel" runat="server" CssClass="bar_feature_content"></asp:Label></div>
        </div>
	</div>
<div id="wrapper">
	<div id="header">
		<h1>Staina House <br /> Dental Practice</h1>
		<h2>Neill M. Ward BDS <br /> Paul G. Winstanley BDS</h2>
	</div>
    <div id="linkbar">
		<a href="index.aspx">Home</a>
		<a href="appointment.aspx">Appointments</a>
		<a href="about.aspx">About Us</a>
		<a href="contact.aspx">Contact Us</a>
		<a href="find_us.aspx">Find Us</a>
	</div>
<div id="main">
<div id="content">

<h1><%=heading%></h1>