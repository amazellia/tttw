<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<!--
========================================================
InformationDisplay.xsl
Author: Amanda Patricia D. Viray
Date started: 4/25/2020
Date completed: 5/16/2020

This XSLT file acts as a CSS for the following XMLs:
template.xml
technology.xml
engineering.xml
mathematics.xml

InformationDisplay.xsl
- has been tested with Internet Explorer (IE).

========================================================
-->
<xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
	            <title>&#60;/TEACH&#62; TO THE WORLD</title>
                <meta charset="UTF-8"/>
                <style>
                html {
                    font-family: 'Montserrat', sans-serif;
                    font-size: 16px;
                    background-color: rgba(248,131,121,0.4);
                }

                body {
                    margin: 1cm;
                    padding: 0;
                    /*background-color: rgba(248,131,121,0.4);*/
                }

                h1, a {
                    font-family: 'Space Mono', monospace;
                }

                #titleCourse {
                    padding: 3% 3% 1% 1%;
                    background-color: black;
                    color: coral;
                }

                #nav {
                    padding: 20px;
                    width: 100%;
                    background-color: black;
                }

                #nav a {
                    text-decoration: none;
                }

                #nav a:link {
                    color: coral;
                }

                #nav a:visited{
                    color: #40E0D0;
                }

                .content {
                    margin: 2cm;
                    padding: 1rem;
                    background-color: rgba(255, 255, 255, 0.6);
                    border-radius: 25px;
                }

                img {
                    display:block;
                    margin-left: auto;
                    margin-right: auto;
                    width: 100%;
                }

                #durationTable {
                    padding: 20px;
                    width: 100%;
                    background-color: black;
                    color: white;
                    text-align: center;
                }

                #COtable {
                    padding: 20px;
                    width: 100%;
                    background-color: black;
                    color: white;
                    text-align: center;
                }

                #leftTD {
                    text-align: left;
                }

                #background {
                    background-image: url("media/background2.jpg");
                    background-size: cover;
			        background-repeat: no-repeat;
                }

                #rightFooter {
                    list-style-type: none;
                    text-align: right;
                    margin-right: 20px;
                    text-decoration: none;
                    color: coral;
                }
                </style>
            </head>

            <body>
            <h1 align="center">&#60;/TEACH&#62; TO THE WORLD</h1>

            <!--id="background" is the backgound picture for the xml-->
            <div id="background">

            <!-- === Navigation Bar === -->
	        <table id="nav">
                <tr>
		            <th><a href="index.html">Home</a></th>
		            <th><a href="technology.xml">Technology</a></th>
		            <th><a href="engineering.xml">Engineering</a></th>
		            <th><a href="mathematics.xml">Mathematics</a></th>
		            <th><a href="form.html">Enrollment</a></th>
		            <th><a href="contact.html">Contact</a></th>
		            <th><a href="aboutUs.html">About Us</a></th>
                </tr>
            </table>
            
            <!-- === Content of the XML === -->
                <div class="content">
                    <!--Title of STEM Strand-->
                    <h1><xsl:value-of select="//@area"/></h1>

                    <!--Course Content-->
                    <xsl:for-each select = "//course">

                        <!--Collecting each course element to sort them alphabetically by their course names-->
                        <xsl:sort select="program/name"/>

                        <!--Course Overview-->
                        <h2 id="titleCourse"><xsl:value-of select="program/coursecode"/><xsl:text> </xsl:text><xsl:value-of select="program/name"/></h2>

                        <table id="COtable">
                            <tr>
                            <td><h3><xsl:text>Course Code: </xsl:text><xsl:value-of select="program/coursecode"/></h3></td>
                            <td><h3><xsl:text>Units: </xsl:text><xsl:value-of select="program/units/@type"/></h3></td>
                            <td><h3><xsl:text>Level: </xsl:text><xsl:value-of select="program/level/@lvl"/></h3></td>
                            <td id="leftTD"><xsl:value-of select="//srtdescription"/></td>
                            </tr>
                        </table>

                        <!--Course Image-->
                        <img alt="Picture not found">
                            <xsl:for-each select="picture//@source">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                            </xsl:for-each>
                        </img>

                        <!--Course Duration-->
                        <table id="durationTable">
                            <xsl:for-each select="duration/.">
                                <tr>
                                    <th rowspan="3"><h2>Duration:</h2></th>
                                    <th colspan="2"><h2><xsl:value-of select="weeks/@number"/><xsl:text> weeks</xsl:text></h2></th>
                                </tr>
                                <tr>
                                    <td rowspan="2"><h2><xsl:text>Per week: </xsl:text><xsl:value-of select="perWeek/@hours"/><xsl:text> hours</xsl:text></h2></td>
                                    <td><h3><xsl:text>Lecture: </xsl:text><xsl:value-of select="perWeek/lecture/@hours"/><xsl:text> hours</xsl:text></h3></td>
                                </tr>
                                <tr>
                                    <td><h3><xsl:text>Lab: </xsl:text><xsl:value-of select="perWeek/lab/@hours"/><xsl:text> hours</xsl:text></h3></td>
                                </tr>
                            </xsl:for-each>
                        </table>

                        <!--Course Objectives-->
                        <h2>Objectives</h2>
                        <ol>
                        <xsl:for-each select="objectives/*">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                        </ol>

                        <!--Course Costs-->
                        <h2>Cost</h2>
                        <xsl:for-each select="cost/.">
                            <xsl:text>Price per semester: </xsl:text><xsl:value-of select="semester/@cost"/><xsl:text> </xsl:text><xsl:value-of select="semester/@currency"/><br/>
                            <xsl:text>Price per semester with Scholarship: </xsl:text><xsl:value-of select="wScolarship/@cost"/><xsl:text> </xsl:text><xsl:value-of select="wScolarship/@currency"/><br/>
                        </xsl:for-each>

                        <!--Course Description-->
                        <h2>Description</h2>
                            <xsl:for-each select="lngdescription/.">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        
                        <!--Course Videos-->
                        <h2>Videos</h2>
                        <a>
                            <xsl:for-each select="video/*">
                                <xsl:attribute name="href">
                                <xsl:value-of select="."/>
                                </xsl:attribute>
                                <xsl:value-of select="."/><br/>
                            </xsl:for-each>
                        </a>

                        <!--Curriculum-->
                        <h2>Curriculum</h2>
                            <ul>
                                <xsl:for-each select = "curriculum/*">
                                    <li><xsl:value-of select="."/></li>
                                </xsl:for-each>
                            </ul>

                        <!--URL-->
                        <a>
                            <xsl:for-each select="URL/@source">
                                <xsl:attribute name="href">
                                <xsl:value-of select="."/>
                                </xsl:attribute>
                                <xsl:text> Prepared by yours truly, The University of Newcastle, Australia</xsl:text>
                            </xsl:for-each>
                        </a>
                    </xsl:for-each> <!--End of Course Content-->
                </div> <!--class="content" ends here-->
            

            <!-- === Footer === -->
            <table id="nav">
                <tr>
		            <th><a href="aboutUs.html">About Us</a></th>
		            <th><a href="contact.xml">Contact</a></th>
		            <th><a href="https://www.visser.com.au/blog/generic-privacy-policy-for-australian-websites/">Privacy Policy</a></th>
		            <th><a href="https://media.termsfeed.com/pdf/terms-and-conditions-template.pdf">Terms and Conditions</a></th>
                    <td> 
                        <!-- Author's Copyright Statement -->
                        <ul id="rightFooter">
		                    <li>&#169; 2020 by <a href="https://amandaviray.wixsite.com/amazellia">Amanda Patricia D. Viray</a></li>
		                    <li>AmandaPatricia.Viray@uon.edu.au</li>
		                    <li>Bachelor of Information Technology - Interactive Media</li>
	                    </ul>
                    </td>
                </tr>
            </table>

            </div> <!--id="background"-->
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>