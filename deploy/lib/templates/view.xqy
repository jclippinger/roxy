xquery version "1.0-ml";

import module namespace vh = "http://marklogic.com/roxy/view-helper" at "/lib/view-helper.xqy";

declare namespace html = "http://www.w3.org/1999/xhtml";

declare option xdmp:mapping "false";

(: use the vh:required method to force a variable to be passed. it will throw an error
 : if the variable is not provided by the controller :)
(:
  declare variable $title as xs:string := vh:required("title");
    or
  let $title as xs:string := vh:required("title");
:)

(: grab optional data :)
(:
  declare variable $stuff := vh:get("stuff");
    or
  let $stuff := vh:get("stuff")
:)

<div xmlns="http://www.w3.org/1999/xhtml" class="#controller #view">
  <p>This file lives at: #location</p>
  <p>{fn:string(vh:get("message"))}</p>
</div>