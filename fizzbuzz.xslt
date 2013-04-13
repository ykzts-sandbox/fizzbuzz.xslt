<?xml version="1.0" encoding="UTF-8"?>
<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <param name="number" select="100"/>
  <output encoding="UTF-8" method="text"/>

  <template match="/">
    <variable name="result">
      <call-template name="count-number">
        <with-param name="number" select="$number"/>
      </call-template>
    </variable>
    <value-of select="$result"/>
  </template>

  <template name="count-number">
    <param name="number" select="1"/>
    <if test="$number &gt; 1">
      <call-template name="count-number">
        <with-param name="number" select="$number - 1"/>
      </call-template>
    </if>
    <call-template name="fizzbuzz">
      <with-param name="number" select="$number"/>
    </call-template>
  </template>

  <template name="fizzbuzz">
    <param name="number" select="1"/>
    <variable name="fizzbuzz">
      <call-template name="fizz">
        <with-param name="number" select="$number"/>
      </call-template>
      <call-template name="buzz">
        <with-param name="number" select="$number"/>
      </call-template>
    </variable>
    <choose>
      <when test="string-length($fizzbuzz) &gt; 0">
        <value-of select="$fizzbuzz"/>
      </when>
      <otherwise>
        <value-of select="$number"/>
      </otherwise>
    </choose>
    <text>&#10;</text>
  </template>

  <template name="fizz">
    <param name="number" select="1"/>
    <if test="not($number mod 3)">
      <text>Fizz</text>
    </if>
  </template>

  <template name="buzz">
    <param name="number" select="1"/>
    <if test="not($number mod 5)">
      <text>Buzz</text>
    </if>
  </template>
</stylesheet>
