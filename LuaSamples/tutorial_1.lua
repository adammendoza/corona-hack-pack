
-- Having a program or script print out "Hello World" is a programming tradition...
print( "Hello World!" )

-- By the way, when a line of text starts with two hyphens '--', it's a comment.
-- Comments are just notes added by a programmer to explain what the code is doing.

-- If you want to have multiple lines of comments, you can bracket the lines with '--[[ ]]--'

--[[
	This is a multi-line comment for those who like to write a lot!
--]]

--==============================================================================


-- Variables are used to hold a value such as a number or a string of characters.

var1 = 10
var2 = "This is a string!"

print( var1 )
print( var2 )

-- Lua is a Dynamically Typed language, therefore, variables can be reassigned to
-- other values even if the type is different.

var1 = "Now, this var is a string!"
var2 = 20

print( var1 )
print( var2 )

-- If you're uncertain of a value's type, use the type() function to see what it is.

print( type(var1) )
print( type(var2) )

-- Assigning nil to a variable deletes or invalidates it.

var1 = nil
print( var1 )
print( type(var1) )

--==============================================================================

-- You can use letters, digits, and underscores when naming your variables, but 
-- you can not start a variable with a digit.

var   = 0 -- Fine.
var1  = 0 -- Fine.
var_1 = 0 -- Fine.
_var  = 0 -- Fine.
-- 1var  = 0 -- Syntax Error!

-- Also, you can't name your variables after any of Lua's reserved keywords:
--
-- and break do else elseif
-- end false for function if
-- in local nil not or repeat
-- return then true until while

--==============================================================================

-- By default, all variables are global unless you use the local keyword before
-- them. You've been warned!

--[[

gMyGlobalVar = 10
local myLocalVar = 20

--]]

--==============================================================================

-- Variable examples

--[[

myNumber = 10
myString = "This is a string"
myTable = { 2, 4, 6, 8, 10 }

print( "myNumber = " .. type( myNumber ) )
print( "myString = " .. type( myString ) )
print( "myTable = " .. type( myTable ) )

-- Booleans are either true or false.
-- Setting a Boolean to nil is the same as setting it to false

myBoolean = true
print( myBoolean )
print( type(myBoolean) )

-- Some languages also allow the number 0, to mean false - but not in Lua.

myBoolean = 0
print( myBoolean )
print( type(myBoolean) )

--]]

--==============================================================================

-- Lua supports the automatic coercion of types.

myNumber = 6
myString = '6'
sum =  myNumber + myString

-- The following will print 12
print( sum )

-- You can force coercion of types via these Lua functions

widthAsNumber = tonumber( "1024" )
widthAsString = tostring( 1024 )

--==============================================================================
  
-- Define strings with double quotes, single quotes, or double square brackets
-- for multi-line quotes.

-- myString1 = "Hello."

-- myString2 = 'Hello.'

-- myString3 = [[
-- 	Hello. My name is Inigo Montoya.
-- 	You killed my father. Prepare to die.
-- ]]

-- print( myString1 )
-- print( myString2 )
-- print( myString3 )

-- Error if you mix " and '.
-- myString4 = "Hello.'
-- print( myString4 )

--==============================================================================

-- Using Escape Sequences

--[[

-- Use '\n' to break text onto the next line.
print( "Line 1.\nLine 2.\nLine 3.")

-- Use '\t' to insert tabs.
print( "Column 1\tColumn 2\tColumn 3")

-- Use '\"' to insert double quotes inside a double quoted string.
print( "He said, \"Hello. My name is Inigo Montoya. You killed my father. Prepare to die.\"" )

-- Use '\'' to insert single quotes inside a single quoted string.
print( 'He said, \'Hello. My name is Inigo Montoya. You killed my father. Prepare to die.\'' )

--]]

-- String Escape Sequences:
--
-- \a	bell
-- \v	vertical tab
-- \f	form feed
-- \n	newline
-- \r	return
-- \t	horizontal tab
-- \b	backspace
-- \\	backslash
-- \"	double quote
-- \'	single quote
-- \[	bracket
-- \]	bracket

--==============================================================================

-- Boolean Operators
--
--     and - Returns true if both expressions are true
--     or  - Returns true if either of the two expressions are true
--     not - Negates the expression.

--[[

local var1 = 10
print( var1 == 10 and var1 < 5 )               -- (Prints false)
print( var1 == 20 or var1 > 5 )                -- (Prints true)
print( not var1 == 10 )                        -- (Prints false)

print( var1 == 10 and tostring(var1) == "10" ) -- (Prints true)

--]]

--==============================================================================

--[[

local x = 5
local y = 5 + 5
print( x, y )

x, y = 20, 50 -- Initial assignment.
print( x, y )

x, y = y, x   -- Assignment that swaps values around.
print( x, y )

local a, a = 1, 2 -- Nonsensical, but if you're wondering the last assignment wins.
print( a )

--]]

--==============================================================================

--print( "Game " .. "Over!" )