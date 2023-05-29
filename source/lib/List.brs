
'''''''''
' LinkedList: A linked list implementation in BrightScript 
'   It returns an object with the following methods:
'   _New() as object
'   AddFront(list as object, item as dynamic) as void
'   AddLast(list as object, item as dynamic) as void
'   Size(list as object) as integer
'   IsEmpty(list as object) as boolean
'   Contains(list as object, item as dynamic) as boolean
'   Node(item as dynamic, nextNode as object) as object
' 
' @return {object}
'''''''''
function LinkedList() as object
    print "LinkedList() run"

    this = {

        ' field private contains "_private" methods and fields
        ' we use separate "_private" field (object) to store private methods and fields
        '
        ' Brightscript does not support private methods and fields, 
        ' so we use a convention to indicate that a method or field is private
        ' as well as we use a convention to indicate that a method is a constructor of an object
        
        "_private": {
            
            "Node": function(item, nextNode)
                node = {
                    "item": item,
                    "nextNode": nextNode
                }
                return node
            end function
        }


        '''''''''
        ' New: Creates a new linked list - "Constructor" of the object
        '
        ' @return {object} list - the new linked list
        '''''''''
        "_New": function()
            list = {
                "first": invalid,
                "last": invalid,
                "size": 0
            }
            return list
        end function

        "AddFirst": function(list, item) as void
            newNode = m._private.Node(item, invalid)

            if list.first = invalid then
                list.first = newNode
                list.last = newNode
            else
                newNode.nextNode = list.first
                list.first = newNode
            end if
            list.size = list.size + 1
        end function

        "AddLast": function(list, item) as void
            newNode = m._private.Node(item, invalid)
            if list.last = invalid then
                list.first = newNode
                list.last = newNode
            else
                list.last.nextNode = newNode
                list.last = newNode
            end if
            list.size = list.size + 1
        end function

        "GetFirst": function(list) as dynamic
            try
                item = list.first.item
            catch e
                print "Warning: the list is empty"
                item = invalid
            end try
            return item
        end function

        "GetLast": function(list) as dynamic
            try
                item = list.last.item
            catch e
                print "Warning: the list is empty"
                item = invalid
            end try
            return item
        end function

        "Size": function(list) as integer
            return list.size
        end function

        "IsEmpty": function(list) as boolean
            return list.size = 0
        end function

        "Contains": function(list, item) as boolean
            node = list.first
            while node <> invalid
                if node.item = item then
                    return true
                end if
                node = node.nextNode
            end while
            return false
        end function

        "ToString": function(list) as string
            node = list.first
            str = ""
            while node <> invalid
                ?" -- node.item: "; node.item
                str = str + node.item + " "
                node = node.nextNode
            end while
            return str
        end function
    }

    return this
end function