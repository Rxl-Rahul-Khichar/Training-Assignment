Map map = ["rahul":21,"ram":25,"divyansh":24,"sarthak":22,"manish":23,"hardik":22,"bhupendra":24,"ankit":23,"nikhil":23,"yogesh":22]
map.eachWithIndex {
it,value->
println it + “. “ + value
 }
println map.find{"rahul"}
