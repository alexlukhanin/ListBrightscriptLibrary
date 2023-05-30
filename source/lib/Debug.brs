'''''''''*****************************************************************************************
'''''''''*******************************DebugUtils library****************************************
'''''''''*****************************************************************************************
' Debug: lib of debug functions that could be used during debugging 
' and performance testing as well
' 
' @return {object}
'''''''''
function Debug() as object
    this = {
        "gAA": GetGlobalAA()
        "global": GetGlobalAA().global
        "top": GetGlobalAA().top


        '''''''''
        ' GetExecutionTime: measures and gets execution time of callback function
        '
        ' @param {function} callback - callback function
        ' @param {integer} iterations - number of iterations for callback function to be executed
        ' @return {object}
        '''''''''
        "GetExecutionTime": function(callback as Function, iterations as Integer) as Integer
            startTime = CreateObject("roTimespan")
            startTime.Mark()

            for i = 0 to iterations
                callback()
            end for

            endTime = CreateObject("roTimespan")
            endTime.Mark()

            executionTime = endTime.TotalMilliseconds() - startTime.TotalMilliseconds()
            print ">>> Debug: for function "; callback.toStr(); " execution time: " ; executionTime; " ms"
            return executionTime
        end function


        '''''''''
        ' Print: prints debug message that shows function name, message and arguments
        '
        ' @param {string} message - additional message to print, some marker, note etc, could be empty
        ' @param {object} args - arguments object that contains all arguments that needed to be printed
        '       args is an assosiated array, where key is argument name and value is argument value
        '       key is a string, value is a dynamic type that gets any type of value
        ' @return {string} functionName - function name that will be printed, could be empty
        '''''''''
        "Print": sub(message as String, args = {} as Object, functionName = "" as String)
            if m.top <> invalid then subtype = m.top.Subtype() else subtype = "~"
            if functionName <> "" then functionName += "() "

            print "{{ debug: "; subtype ; "::"; functionName ; " ::: [" message; "] arguments:" + Chr(10)
            for each item in args.Items()
                print "--- " ; item.key ; "  :  " ; item.value ; Chr(10)
            end for
            print "}}";Chr(10)
        end sub


        '''''''''
        ' PrintChildren: prints children of @obj and also shows function name, message
        '
        ' @param {string} message - additional message to print, some marker, note etc, could be empty
        ' @param {object} obj - object that contains children
        ' @return {string} functionName - function name that will be printed, could be empty
        '''''''''
        "PrintChildren": sub(message as String, obj as Object, functionName = "" as String)
            if m.top <> invalid then subtype = m.top.Subtype() else subtype = "~"
            if functionName <> "" then functionName += "() "

            print "{<<< debug: "; subtype ; "::"; functionName ; " ::: [" message; "] children:" + Chr(10)

            if obj <> invalid and obj.GetChildCount() > 0
                index = 0
                for each child in obj.GetChildren(-1, 0)
                    print "--- child [";index;" ] --> " ; child ; Chr(10)
                    index++
                end for
            else
                print "--- no children" ; Chr(10)
            end if
            print ">>>}";Chr(10)
        end sub
    }

    return this
end function