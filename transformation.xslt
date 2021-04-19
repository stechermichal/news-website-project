<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0"
                encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        {
        "Authors": [
        <xsl:for-each select="authors/author">
            {
            <xsl:sort select="surname" order="ascending"/>
            "Name": "<xsl:value-of select="name"/>",
            "Surname": "<xsl:value-of select="surname"/>",
            "Gender": "<xsl:value-of select="gender"/>",
            "Age": <xsl:value-of select="age"/>,
            "Employee type": "<xsl:value-of select="employee_type"/>",
            "Salary": <xsl:value-of select="salary"/>
            }<xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        ],
        "Info about long articles": [
        <xsl:for-each select="authors/author/articles[avg_article_length_words > 1000]">
            {
            "Average article length": <xsl:value-of select="avg_article_length_words"/>,
            "Articles  usually in": "<xsl:value-of select="articles_topic"/>",
            "Overall article rating": "<xsl:value-of select="overall_article_rating"/>",
            "Number of articles": <xsl:value-of select="num_articles"/>,
            <xsl:choose>
                <xsl:when test="num_articles > 20">"Data pool": "Sufficient"</xsl:when>
                <xsl:otherwise>"Data pool": "Insufficient"</xsl:otherwise>
            </xsl:choose>
            }<xsl:if test="position() != last()">,</xsl:if>
        </xsl:for-each>
        ]
    }
    </xsl:template>
</xsl:stylesheet>