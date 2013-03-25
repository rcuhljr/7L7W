Test := Object clone
Test aMethod := method(a, b, (a + b) println)

Test aMethod(4,5)
name := "aMethod"
method := Test getSlot(name)
method(4,9)