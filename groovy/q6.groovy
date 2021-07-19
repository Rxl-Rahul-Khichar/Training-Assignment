List list = [1,2,3,"element1",0,3,[2,4,6],0,10]
list.each{
it -> println it.class
}
println list.get(6).get(9)