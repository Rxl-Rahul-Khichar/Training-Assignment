Map map = ["1":10, "2":20,"3":30,"4":40]
// this is valid but it will take these key as string
println map[1] //null will be printed
println map["2"]
println map.containsKey("2")