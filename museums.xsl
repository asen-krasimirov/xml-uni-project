<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Каталог на музеи</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <script src="script.js"></script>
            </head>
            <body>
                <h2>Каталог на музеи</h2>

                <!-- Filter Section -->
                <div class="filter-container">
                    <label for="regionFilter">Филтър по регион:</label>
                    <select id="regionFilter" onchange="filterMuseums()">
                        <option value="all">Всички</option>
                        <xsl:for-each select="catalogue/regions/region">
                            <option>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="@regionId"/>
                                </xsl:attribute>
                                <xsl:value-of select="name"/>
                            </option>
                        </xsl:for-each>
                    </select>

                    <label for="typeFilter">Филтър по тип:</label>
                    <select id="typeFilter" onchange="filterMuseums()">
                        <option value="all">Всички</option>
                        <xsl:for-each select="catalogue/museum-types/type">
                            <option>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="@typeId"/>
                                </xsl:attribute>
                                <xsl:value-of select="name"/>
                            </option>
                        </xsl:for-each>
                    </select>
                </div>

                <table>
                    <tr>
                        <th>Име</th>
                        <th>Описание</th>
                        <th>Телефон</th>
                        <th>Работно време</th>
                        <th>Адрес</th>
                        <th>Снимки</th>
                    </tr>
                    <xsl:for-each select="catalogue/museums/museum">
                        <tr class="museumRow">
                            <xsl:attribute name="data-region">
                                <xsl:value-of select="@regionRef"/>
                            </xsl:attribute>
                            <xsl:attribute name="data-type">
                                <xsl:value-of select="@typeRef"/>
                            </xsl:attribute>

                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="description"/></td>
                            <td><xsl:value-of select="additionalInfo/phone"/></td>
                            <td><xsl:value-of select="additionalInfo/workingHours"/></td>
                            <td><xsl:value-of select="additionalInfo/address"/></td>
                            <td>
                                <xsl:for-each select="images/image">
                                    <img>
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="."/>
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of select="../name"/>
                                        </xsl:attribute>
                                    </img>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
