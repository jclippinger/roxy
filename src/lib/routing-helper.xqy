(:
Copyright 2012 MarkLogic Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
:)
xquery version "1.0-ml";

module namespace rh = 'http://marklogic.com/roxy/routing-helper';

import module namespace req = "http://marklogic.com/framework/request" at "/lib/request.xqy";

declare namespace vh = "http://marklogic.com/roxy/view-helper";

declare option xdmp:mapping "false";

declare function rh:render-view($view as xs:string, $format as xs:string, $data as map:map)
{
  let $view-path := fn:concat("/app/views/", $view, ".", $format, ".xqy")
  return
    try {
      xdmp:invoke($view-path, (xs:QName("vh:map"), $data))
    }
    catch($ex) {
      if (($ex/error:name, $ex/error:code) = ("SVC-FILOPN", "XDMP-MODNOTFOUND")) then
        fn:error(xs:QName("MISSING-VIEW"), "")
      else
        xdmp:rethrow()
    }
};

declare function rh:render-layout($layout as xs:string, $format as xs:string, $data as map:map)
{
  let $layout-path := fn:concat("/app/views/layouts/", $layout, ".", $format, ".xqy")
  return
    try {
      xdmp:invoke($layout-path, (xs:QName("vh:map"), $data))
    }
    catch($ex) {
      if (($ex/error:name, $ex/error:code) = ("SVC-FILOPN", "XDMP-MODNOTFOUND")) then
        fn:error(xs:QName("MISSING-LAYOUT"), "")
      else
        xdmp:rethrow()
    }
};
declare function rh:set-content-type($format)
{
  if ($format eq "xml") then
    xdmp:add-response-header("Content-Type", "application/xml")
  else if ($format eq "html") then
    xdmp:add-response-header("Content-Type", "text/html")
  else if ($format eq "json") then
    xdmp:add-response-header("Content-Type", "application/json")
  else if ($format eq "text") then
    xdmp:add-response-header("Content-Type", "plain/text")
  else ()
};