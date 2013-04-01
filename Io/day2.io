day2 := Object clone

day2 fibloop := method(n, 
    if(n < 3, return(1)); 
    a := 1; 
    b := 1;
    for(i, 3, n, c := a; a := a+b; b := c);
    return(a))

day2 fibloop(1) println
day2 fibloop(4) println
day2 fibloop(10) println

day2 fibrec := method(n,
    if(n == 1, return(1));
    return(fibrec(n - 1) + n))
    
day2 fibrec(1) println
day2 fibrec(10) println

Number OldDiv := Number getSlot("/")
Number / := method(a, if(a == 0, return 0, OldDiv(a)))

5/0 println

twodarr := list(list(5,3,2,5),list(1,2),list(1,2,3,4))

day2 arraycount := method(a, a flatten reduce(+))

day2 arraycount(twodarr) println

List myAverage := method( 
    if(self reduce(xs, x, x type == "Number" and xs, true),
        self sum / self size,
        Exception raise("Average requires all numeric values")))
        
list(1,2,3,4,5) myAverage println
e := try(
    list(1,2,3,4,"ted") myAverage println
)
e catch(Exception, e println)

List2 := Object clone

List2 theData := nil
List2 dimx := nil
List2 dimy := nil
List2 dim := method(x, y,
    theData = list();
    dimx = x;
    dimy = y;
    for(i, 0, (y-1), theData append(list()); for(j, 0, (x-1), theData at(i) append(nil))))
    
List2 set := method(x, y, val, theData at(y) atPut(x, val)) 

List2 get := method(x, y, theData at(y) at(x))

List2 transpose := method(
    result := List2 clone;
    result dim(self dimy, self dimx);
    for(i, 0, (dimy-1), for(j, 0, (dimx-1), result set(i,j, self get(j,i))))
    return result)

myList := List2 clone
myList dim(2,4)
myList set(1,2, "ted")
myList get(1,2) println
myTList := myList transpose
myTList get(2,1) println

file := File clone openForUpdating("outMatrix.txt")
file write(myList serialized)
file close

file openForReading("outMatrix.txt")
stillMyList := doString(file readLines join)
file close
stillMyList get(1,2) println

Game := Object clone

Game try := 1
Game maxTry := 10
Game goal := 0

Game play := method(
    self goal := Random value(100) floor + 1;
    standardIO := File standardInput();
    guess(0, standardIO)
    standardIO close
)

Game guess := method(prev, io,
    write("Guess? (1..100):");
    aGuess := io readLine() asNumber;
    if(aGuess == goal, "You got it!" println; return);    
    if(self try == self maxTry, "Game Over :(" println; return);
    if(self try > 1, 
        if( (aGuess - self goal) abs < (prev-self goal) abs, 
            "Hotter." println, 
            "Colder." println));
    self try = try + 1
    guess(aGuess, io)
)

aGame := Game clone

aGame play