def range = 1..100
def isMultiple3 = { int x -> x%3 == 0 ? x:null}
def isMultiple5 = { int x -> x%5 == 0 ? x:null}
def isMultiple = { int x -> (x%5 == 0 && x%3==0) ? x:null}
range.each{
if(isMultiple3(it) && isMultiple5(it)){
    
        println "Fizz Buzz"
            
}
else if(isMultiple3(it)){
println "Fizz"
}
else if(isMultiple5(it)){
println "Buzz"
}

else{
println it
}
}
