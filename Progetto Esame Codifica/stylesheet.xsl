<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" >

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
  <html>
    <head>
      <link rel="stylesheet" type="text/css" href="style.css" media="screen" />
      <script src="script.js"> </script>
      <meta charset="UTF-8"/>
        <title>
          <xsl:value-of select="//tei:title[@xml:id='maintitle']"/>
        </title>
    </head>

    <body>
      <section id="introsection">
          <h1> Giovannino a Oliva, Edizione Digitale delle Corrispondenze tra il 1916 e il 1917 </h1>

          <a id="ancora" href="#introsection" title="Torna Su">
            &#11165;
          </a>

        <div class="intro">
          <b>Il Fine del Progetto è la realizzazione dell'edizione digitale delle corrispondenze iniviate da Giovanni a Oliva Turtura nel periodo tra il 1916 e il 1917.</b>
          <br />
         <b>Le fonti relative al progetto sono conservate al  <xsl:value-of select="//tei:teiHeader[@xml:id='common']//tei:repository"/>
         situato a <xsl:value-of select="//tei:teiHeader[@xml:id='common']//tei:settlement"/>.</b>
          <br />

        </div>

          <div id="cartoline">
            <h2>Clicca su una delle 3 cartoline per visualizzarne il contenuto codificato:</h2>
            <div id="cartolina">
              <a href="#testocartoline">
                  <input class = "overlay" type="image" name="click" src="./7694-036/7694-036F.jpg" alt="img1" id="img1"></input>
              </a>
            </div>

            <div id="cartolina">
              <a href="#testocartoline">
                <input class = "overlay" type="image"  name="click" src="./7694-137/7694-137F.jpg" alt="img2" id="img2"></input>
              </a>
            </div>

            <div id="cartolina">
              <a href="#testocartoline">
                <input class = "overlay" type="image"  name="click" src="./7694-151/7694-151F.jpg" alt="img2" id="img3"></input>
              </a>
            </div>

          </div>
      </section>

      <section id="testocartoline">

        <div id="text">
          <div id="imgs">
            <div id="fimgs">
              <xsl:apply-templates select="//tei:facsimile"/>
              <xsl:apply-templates select="//tei:surface[@type='rimg']/tei:graphic"/>
            </div>
            <xsl:apply-templates select="//tei:TEI/tei:text/tei:body/tei:div[@type='retro']"/>
          </div>
          <div id="description">
            <p id="desc36"><b>Descrizione del fronte della cartolina: </b><br /><xsl:value-of select="//tei:div[@xml:id='frontedesc36']//tei:figDesc"/></p>
            <p id="desc151"><b>Descrizione del fronte della cartolina: </b><br /><xsl:value-of select="//tei:div[@xml:id='frontedesc151']//tei:figDesc"/></p>
            <p id="desc137"><b>Descrizione del fronte della cartolina: </b><br /><xsl:value-of select="//tei:div[@xml:id='frontedesc137']//tei:figDesc"/></p>
            <xsl:apply-templates select="//tei:TEI/tei:teiHeader"/>
          </div>
        </div>
      </section>

            <section id="altreinfo">
             <div id="about">
             <strong class="tabout"> Responsabili </strong> <br />
               <xsl:apply-templates select="//tei:respStmt"/>
             <strong class="tabout"> Permessi </strong> <br />
               A partire dal <xsl:value-of select="//tei:teiHeader[@xml:id='common']/tei:fileDesc/tei:publicationStmt/tei:date"/>  <br />
               <xsl:value-of select="//tei:availability"/>  concessa dal <xsl:value-of select="//tei:teiHeader[@xml:id='common']//tei:addrLine"/> <br/> <br/>

             </div>
           </section>
    </body>
  </html>
</xsl:template>

<xsl:template match="//tei:respStmt">
  <xsl:apply-templates/>  <br />
</xsl:template>

<xsl:template match="//tei:div[@type='retro']">
  <xsl:variable name="index" select="position()"/>
  <xsl:element name="div" >
    <xsl:attribute name="id">
        <xsl:value-of select="concat('Contents_' , $index) "/>
    </xsl:attribute>
    <h4>Posiziona il cursore sul retro della cartolina per evidenziare il testo codificato</h4>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>


<xsl:template match="//tei:TEI/tei:teiHeader">
    <xsl:variable name="index2" select="position()"/>
    <xsl:element name="div" >
      <xsl:attribute name="id">
        <xsl:value-of select="concat('postheader_' , $index2) "/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
</xsl:template>

<xsl:template match="//tei:notesStmt">
      <h3> &#9658; Note </h3>
      <div id="notes"> <xsl:apply-templates/> </div>
</xsl:template>

<xsl:template match="//tei:notesStmt/tei:note">
    <xsl:variable name="index3" select="position()"/>
      <xsl:element name="p">
        <xsl:attribute name="id">
          <xsl:value-of select="concat('note_' , $index3)"/>
        </xsl:attribute>
        <strong>   Nota <xsl:value-of select="@n"/>:</strong> <xsl:value-of select="."/> <br />
      </xsl:element>
</xsl:template>

<xsl:template match="//tei:sourceDesc">
  <div id="scheda_bibliografica">
    <h3> &#9658; Informazioni sulla cartolina</h3>
    <xsl:apply-templates/>
   </div>
</xsl:template>


<xsl:template match="//tei:title[@type='t1']">
    <p id="t1"><xsl:value-of select="."/> </p>
</xsl:template>

<xsl:template match="//tei:orgName[@type='t2']">
    <p id="t2"><xsl:value-of select="."/> </p>
</xsl:template>

<xsl:template match="//tei:title[@type='custom']">
    <p><strong> Titolo: </strong><xsl:value-of select="."/> </p>
</xsl:template>

<xsl:template match="//tei:bibl/tei:date">
   <p> <strong> Data di scrittura: </strong> <xsl:value-of select="."/> </p>
</xsl:template>

<xsl:template match="//tei:bibl/tei:pubPlace">
      <p> <strong> Luogo di pubblicazione:</strong> <xsl:value-of select="."/> </p>
</xsl:template>

<xsl:template match="//tei:sourceDesc/tei:msDesc/tei:msIdentifier">
      <p><strong> Codice identificativo cartolina: </strong> <xsl:value-of select="./tei:idno"/> </p>
</xsl:template>

<xsl:template match="//tei:msContents" >
     <p> <strong> Descrizione:  </strong>  <xsl:value-of select="//tei:msContents/tei:summary"/>
      Scritta in <xsl:value-of select="//tei:msContents/tei:textLang"/> </p>
</xsl:template>

<xsl:template match="//tei:sourceDesc/tei:listPerson">
   <div id="people">
         <strong> Persone: </strong>
       <ul>
        <xsl:apply-templates/>
       </ul>
   </div>
</xsl:template>

<xsl:template match="//tei:sourceDesc/tei:listPlace">
   <div id="cities">
         <strong> Città: </strong>
       <ul>
        <xsl:apply-templates/>
       </ul>
   </div>
</xsl:template>

<xsl:template match="//tei:bibl/tei:publisher">
   <p> <strong>Editore:</strong> <xsl:value-of select="."/>  </p>
</xsl:template>

<xsl:template match="//tei:encodingDesc">
   <div id="IntEdi">
         <strong> Interpretazioni Editoriali: </strong>
       <ul>
        <xsl:apply-templates/>
       </ul>
   </div>
</xsl:template>

<xsl:template match="//tei:interpretation/tei:p/tei:list/tei:item/tei:choice">
      <li>  <b><xsl:value-of select="./*[@type='orig']"/> : </b><xsl:value-of select="./*[@type='inter']"/></li>
</xsl:template>

<xsl:template match="//tei:listPerson/tei:person">
      <li>  <xsl:apply-templates/>  </li>
</xsl:template>

<xsl:template match="//tei:person/tei:persName">
     <xsl:value-of select="."/> -
</xsl:template>

<xsl:template match="//tei:person/tei:sex">
      <xsl:value-of select="."/>  -
</xsl:template>

<xsl:template match="//tei:place">
    <li>
      <xsl:value-of select="./tei:district[@type='comune']"/> , <xsl:value-of select="./tei:district[@type='provincia']"/>
    </li>
</xsl:template>

<xsl:template match="//tei:district[@type='common']">
      <xsl:value-of select="."/>
</xsl:template>


<xsl:template match="//tei:profileDesc">
 <div>
  <strong id="AttCorr">Atto di corrispondenza: </strong>
   <ul id="AttoCorrispondenza">
     <li>  cartolina spedita da <xsl:value-of select="//tei:correspAction[@type='sent']/tei:placeName" /> </li>
     <li>  cartolina arrivata a <xsl:value-of select="//tei:correspAction[@type='received']/tei:placeName" /> </li>
   </ul>
 </div>
</xsl:template>

<xsl:template match="//tei:lb">
      <br/> <xsl:apply-templates/>
</xsl:template>

<xsl:template match="//tei:addrLine">
     <p> <xsl:apply-templates/> </p>
</xsl:template>

<xsl:template match="//*[@type='ccl']" >
    <xsl:element name="div">
    <xsl:attribute name="id">
      <xsl:value-of select="@xml:id"/>
    </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
</xsl:template>

<xsl:template match="//tei:physDesc">
    <p><b>Caratteristiche: </b>
        <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:objectType"/> di <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:material"/>,
        con dimensioni in cm <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:height"/>
        x <xsl:value-of select="current()//tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:width"/>.</p>
    <p><b>Francobolli/timbri: </b>
        <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:stamp[@type='postage']"/> /
        <xsl:value-of select="current()/tei:objectDesc/tei:supportDesc/tei:support/tei:stamp[@type='postmark']"/>
        </p>
    <p><b>Stato di Conservazione: </b>
    <xsl:value-of select="//tei:supportDesc/tei:condition"/>
        </p>
</xsl:template>

<xsl:template match="//tei:facsimile">
   <xsl:variable name="index4" select="position()"/>
   <xsl:for-each select="tei:surface[@type='fimg']/tei:graphic">
     <xsl:element name="img">
       <xsl:attribute name="id">
          <xsl:value-of select="concat('postfront_' , $index4) "/>
       </xsl:attribute>
       <xsl:attribute name="src">
            <xsl:value-of select="current()/@url "/>
       </xsl:attribute>
          <xsl:apply-templates/>
    </xsl:element>
   </xsl:for-each>
</xsl:template>

<xsl:template match="//tei:surface[@type='rimg']/tei:graphic">
    <xsl:variable name="index5" select="position()"/>
    <xsl:element name="img">
    <xsl:attribute name="usemap">
          <xsl:value-of select="concat('#map',$index5)"/>
    </xsl:attribute>
    <xsl:attribute name="id">
          <xsl:value-of select="concat('postretro_', $index5)"/>
    </xsl:attribute>
    <xsl:attribute name="src">
          <xsl:value-of select="current()/@url "/>
    </xsl:attribute>
    <xsl:element name="map">
          <xsl:attribute name="name">
            <xsl:value-of select="concat('map',$index5)"/>
          </xsl:attribute>
          <xsl:if test="$index5='1'"><xsl:apply-templates select="//tei:surface[@xml:id='retro36']/tei:zone"/></xsl:if>
          <xsl:if test="$index5='2'"><xsl:apply-templates select="//tei:surface[@xml:id='retro137']/tei:zone"/></xsl:if>
          <xsl:if test="$index5='3'"><xsl:apply-templates select="///tei:surface[@xml:id='retro151']/tei:zone"/> </xsl:if>
   </xsl:element>
  </xsl:element>
</xsl:template>

<xsl:template match="//tei:zone">
  <xsl:element name="area">
       <xsl:attribute name="id">
          <xsl:value-of select="@xml:id"/>
       </xsl:attribute>
       <xsl:attribute name="shape">
          <xsl:value-of select="concat('rect','')"/>
      </xsl:attribute>
      <xsl:attribute name="coords">
          <xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/>
      </xsl:attribute>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
