

'''''''''
' LinkedList: A linked list implementation in BrightScript 
'   It returns an object with the following methods:
'   New() as object
'   AddFront(list as object, value as dynamic) as void
'   AddLast(list as object, value as dynamic) as void
'   Size(list as object) as integer
'   IsEmpty(list as object) as boolean
'   Contains(list as object, value as dynamic) as boolean
'   Node(value as dynamic, nextNode as object) as object
' 
' @return {object}
'''''''''
function LinkedList() as object
    this = {

        ' field private contains private functions
        "private": {
            "privateFunction": function()
                print "private function RUN!!!"
            end function
            
            "Node": function(value, nextNode)
                node = {
                    "value": value,
                    "nextNode": nextNode
                }
                m.privateFunction()
                return node
            end function
        }

        ' "Node": function(value, nextNode)
        '     node = {
        '         "value": value,
        '         "nextNode": nextNode
        '     }
        '     m.private.privateFunction()
        '     return node
        ' end function

        '''''''''
        ' New: Creates a new linked list - "Constructor" of the object
        '
        ' @return {object} list - the new linked list
        '''''''''
        "New": function()
            list = {
                "first": invalid,
                "last": invalid,
                "size": 0
            }
            return list
        end function

        "AddFirst": function(list, value) as void
            newNode = m.private.Node(value, invalid)
            if list.first = invalid then
                list.first = newNode
                list.last = newNode
            else
                newNode.nextNode = list.first
                list.first = newNode
            end if
            list.size = list.size + 1
        end function

        "AddLast": function(list, value) as void
            newNode = m.private.Node(value, invalid)
            if list.last = invalid then
                list.first = newNode
                list.last = newNode
            else
                list.last.nextNode = newNode
                list.last = newNode
            end if
            list.size = list.size + 1
        end function

        "Size": function(list) as integer
            return list.size
        end function

        "IsEmpty": function(list) as boolean
            return list.size = 0
        end function

        "Contains": function(list, value) as boolean
            node = list.first
            while node <> invalid
                if node.value = value then
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
                ?" -- node.value: "; node.value
                str = str + node.value + " "
                node = node.nextNode
            end while
            return str
        end function
    }

    return this
end function