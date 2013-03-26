Test := Object clone
Test aMethod := method(a, b, (a + b) println)

Test aMethod(4,5)
name := "aMethod"
test := Test getSlot(name)
test(4,9)
Test perform(name, 4, 9)