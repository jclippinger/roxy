xquery version "1.0-ml";

import module namespace test="http://marklogic.com/ps/test-helper" at "/test/test-helper.xqy";

(: create a test controller and views :)
test:load-test-file("tester.xqy", xdmp:modules-database(), "/app/controllers/tester.xqy"),
test:load-test-file("missing-map.xqy", xdmp:modules-database(), "/app/controllers/missing-map.xqy"),
test:load-test-file("different-layout.html.xqy", xdmp:modules-database(), "/app/views/tester/different-layout.html.xqy"),
test:load-test-file("different-view-xml-only.html.xqy", xdmp:modules-database(), "/app/views/tester/different-view-xml-only.html.xqy"),
test:load-test-file("main.html.xqy", xdmp:modules-database(), "/app/views/tester/main.html.xqy"),
test:load-test-file("main.xml.xqy", xdmp:modules-database(), "/app/views/tester/main.xml.xqy"),
test:load-test-file("missing-variable.html.xqy", xdmp:modules-database(), "/app/views/tester/missing-variable.html.xqy"),
test:load-test-file("missing-layout.html.xqy", xdmp:modules-database(), "/app/views/tester/missing-layout.html.xqy"),
test:load-test-file("no-layout.html.xqy", xdmp:modules-database(), "/app/views/tester/no-layout.html.xqy"),
test:load-test-file("view-that-returns-the-input.html.xqy", xdmp:modules-database(), "/app/views/tester/view-that-returns-the-input.html.xqy"),
test:load-test-file("different-layout.html", xdmp:modules-database(), "/app/views/layouts/different-layout.html.xqy"),
test:load-test-file("test-layout.html.xqy", xdmp:modules-database(), "/app/views/layouts/test-layout.html.xqy")