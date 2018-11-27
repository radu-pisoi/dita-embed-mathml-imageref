<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    xmlns:relpath="http://www.oxygenxml/relpathutils"
  >
  <xsl:template match="*[contains(@class, ' topic/image ')][ends-with(@href, '.mml')]">
    <xsl:copy-of select="document(concat(relpath:getParent(@xtrf), '/', @href))"/>
  </xsl:template>
  
  <xsl:function name="relpath:getParent">
    <xsl:param name="sourcePath"/>
    <xsl:variable name="sourcePathCorrected" select="replace($sourcePath, '\\', '/')"/>
    <xsl:value-of select="string-join(tokenize($sourcePathCorrected, '/')[position() &lt; last()], '/')"/>
  </xsl:function>
</xsl:stylesheet>