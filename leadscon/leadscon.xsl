<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<body>
				<h2 align="center">Tweets on 'leadscon' hash</h2>
				<table border="0">
					<tr style="background-color:#f00">
						<th style="padding: 5px">USER</th>
						<th>INFO</th>
					</tr>
					<xsl:for-each select="root/item">
						<tr style="background-color:#eee;">
							<td style="padding:10px; "><a href="{link}"><xsl:value-of select="msg"/></a></td>
							<td style="padding:10px"><b>Full name</b>: <xsl:value-of select="user/profile_info/full_name"/><br/>
								<b>Location</b>: <xsl:value-of select="user/profile_info/location"/><br/>
								<b>Website</b>: <a href="{user/profile_info/website}"><xsl:value-of select="user/profile_info/website"/></a><br/>
									<b>Bio</b>: <xsl:value-of select="user/profile_info/bio"/><br/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
