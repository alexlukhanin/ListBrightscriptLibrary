

'''''''''
' init: Flagscene - is the place where lib code could be checked
' 
'''''''''
sub init()
    m.top.signalBeacon("AppLaunchComplete")

    print "Glory to Ukraine!"
    print "Glory to the heroes!"

    print "Press 'Home' key to exit"
    
    ' instantiate a new linked list entity
    list = LinkedList().New()
    print list

    ' check if list is empty
    if LinkedList().IsEmpty(list) then
        print "list is empty - true"
    else
        print "list is not empty - false"
    end if

    ' adding first element one by one
    LinkedList().AddFirst(list, "first")
    LinkedList().AddFirst(list, "second")
    LinkedList().AddFirst(list, "third")

    print list
    print " >>> list = "; LinkedList().ToString(list)
    ?">>>> size of the list = "; LinkedList().Size(list)

    LinkedList().AddLast(list, "last1")
    LinkedList().AddLast(list, "last2")
    LinkedList().AddLast(list, "last3")

    print "After add last" list 
    print ">>>> size of the list = "; LinkedList().Size(list)
    print " >>> list = "; LinkedList().ToString(list)
end sub