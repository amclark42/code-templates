xquery version "3.1";

  module namespace t="http://exist-db.org/xquery/test";
(:  LIBRARIES  :)
  declare namespace test="http://exist-db.org/xquery/xqsuite";
(:  NAMESPACES  :)
  declare namespace array="http://www.w3.org/2005/xpath-functions/array";
  declare namespace map="http://www.w3.org/2005/xpath-functions/map";
  declare namespace output="http://www.w3.org/2010/xslt-xquery-serialization";
  declare namespace xdb="http://exist-db.org/xquery/xmldb";

(:~
  http://exist-db.org/exist/apps/doc/xqsuite.xml
  
  @author Ash Clark
  2022
 :)
 
 
 
(:  VARIABLES  :)
  


(:  FUNCTIONS  :)
  
  declare
    %test:setUp
  function t:setup() {
    let $testCol := xdb:create-collection("/db", "test")
    let $indexCol := xdb:create-collection("/db/system/config/db", "test")
    return (
        xdb:store("/db/test", "test.xml", $t:XML),
        xdb:store("/db/system/config/db/test", "collection.xconf", $t:xconf),
        xdb:reindex("/db/test")
      )
  };
  
  declare
    %test:tearDown
  function t:tearDown() {
    xdb:remove("/db/test"),
    xdb:remove("/db/system/config/db/test")
  };
  
  declare
      %test:assertTrue
  function t:test() {
    let $test-data := collection('/db/test')
    for $result in $test-data//root
    return
     count($result) eq 1
  };
