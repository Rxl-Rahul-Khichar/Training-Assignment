Range range  = 1..10
println "${range}"
def isEven = { int x -> x%2 == 0 ? x:null}
range.each{
    if(isEven(it))
        println it
        }

