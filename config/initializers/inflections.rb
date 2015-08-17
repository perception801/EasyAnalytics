 ActiveSupport::Inflector.inflections(:en) do |inflect|
   inflect.acronym 'API'
 end
curl -v -H "Accept: application/json" -H "Origin: http://grady.com/antonia_goldner" -H "Content-Type: application/json" -X POST -d '{"name":"foobar"}'  http://localhost:3000/api/events