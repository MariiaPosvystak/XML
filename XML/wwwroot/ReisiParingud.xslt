<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">
		<table>
			<thead>
				<tr>
					<th>Riik</th>
					<th>Pikkus</th>
					<th>Transport</th>
					<th>Hotell</th>
					<th>Ekskursioonid</th>
					<th>Hind</th>
					<th>Hinnang</th>
				</tr>
			</thead>
			<tbody>
			<xsl:for-each select="//reis">
					<xsl:sort select="hinnang" data-type="number" order="descending"/>
					<tr>
						<td>
							<xsl:value-of select="suund/riik"/>
						</td>
						<td>
							<xsl:value-of select="suund/kestvus"/>
						</td>
						<td>
							<xsl:value-of select="transport"/>
						</td>
						<td>
							<xsl:value-of select="majutus"/>
						</td>
						<td>
							<xsl:value-of select="ekskursioonid"/>
						</td>
						<td>
							<xsl:value-of select="muudKulud"/>
						</td>
						<td>
							<xsl:value-of select="hinnang"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<br />
		<br />
		<ol>
			<li><strong>Riigid: </strong><br/>
				<ul>
					<h1>
						<xsl:for-each select="//suund">
							<li>
								<xsl:value-of select="riik"/>
							</li>
						</xsl:for-each>
					</h1>
				</ul>
			</li>
			<li>
			<strong>Reisi andmed: </strong>
				<ul>
					<xsl:for-each select="//reis/suund">
						<li>
							<xsl:attribute name="style">background-color: yellow</xsl:attribute>
							<xsl:value-of select="concat('Riik: ', riik, '; Pikkus: ', kestvus, ' päeva;')"/>
						</li>
					</xsl:for-each>
				</ul>
			</li>
			<li>
			<strong>Pikkus reisid: </strong>
				<ul>
					<xsl:for-each select="//reis/suund">
						<li>
							<xsl:value-of select="concat('Riik: ', riik, '; Pikkus: ', kestvus, ' päeva;')"/>
							<xsl:if test="kestvus > 7">
								<strong> - Pikkus reis.</strong>
							</xsl:if>
						</li>
					</xsl:for-each>
				</ul>
			</li>
			<li>
				<strong>Kogumaksumus: </strong>
				<xsl:value-of select="sum(//muudKulud)"/>
			</li>
			<li>
				<strong>Transport: </strong>
				<ul>
					<xsl:for-each select="reisid/reis">
						<xsl:if test="transport = 'Lennuk'">
							<li>
								<xsl:value-of select="concat(suund/riik, ': ', transport)"/>
							</li>
						</xsl:if>
					</xsl:for-each>
				</ul>
			</li>
			<li>
				<strong>Järjestatuna ↓ :</strong>
				<ul>
					<xsl:for-each select ="reisid/reis">
						<xsl:sort select="suund/kestvus" data-type="number" order="descending"/>
						<li>
							<xsl:value-of select="concat(suund/riik, '(', suund/kestvus, '); Hotell: ', majutus, '; Hind: ', muudKulud)"/>
						</li>
					</xsl:for-each>
				</ul>
			</li>
		</ol>
	</xsl:template>
</xsl:stylesheet>