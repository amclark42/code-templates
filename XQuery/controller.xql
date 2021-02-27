xquery version "3.1";

(:  LIBRARIES  :)
  import module namespace request="http://exist-db.org/xquery/request";
(:  NAMESPACES  :)
  declare namespace array="http://www.w3.org/2005/xpath-functions/array";
  declare namespace exist="http://exist.sourceforge.net/NS/exist";
  declare namespace map="http://www.w3.org/2005/xpath-functions/map";

(:~
  URL-rewriting controller for Application X in eXist-DB
  
  @author Ash Clark
  @since 2021
 :)

  declare variable $exist:path external;
  declare variable $exist:resource external;
  declare variable $exist:controller external;
  declare variable $exist:prefix external;
  declare variable $exist:root external;


(:  MAIN QUERY  :)

if ( $exist:path = ('', '/') ) then
  <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
    <redirect url="{request:get-uri()}/"/>
  </dispatch>

else if ( $exist:path eq '/' ) then
  <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
    <forward url="{$local:defaultPage}"/>
  </dispatch>

(: The index page and assets, XQ, and XSLT folders are passed through as-is. :)
else if ( $exist:path eq 'index.html' 
       or starts-with($exist:path,'/assets')
       or starts-with($exist:path,'/xq')
       or starts-with($exist:path,'/xslt') ) then
  <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
    <cache-control cache="yes"/>
  </dispatch>

(: Any route not matching the above rules will get forwarded to the default webpage. :)
else
  <dispatch xmlns="http://exist.sourceforge.net/NS/exist">
    <forward url="error.html"/>
  </dispatch>
