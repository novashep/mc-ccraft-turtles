--[[
Name: Road Builder Crafting Turtle
Version: 0.01
Author: Nova Shepherd (nova@theshepnet.com)
 
Purpose:
Lay down a 3-wide road with blocks in inventory slots 1-4
Lay down blocks in inventory slots 5-8 on the edges
Go for as long as user prompts for distance or go until obstacle detected

Version History:
11/3/2015 - Initial Version 0.01
Does just 10 blocks in the direction.


 
 
--]]
 
-- Detect if a block is in front of me. Remove if there is.
function DetectDigForward()
        if turtle.detect() then
                turtle.dig()
                turtle.forward()
        else
                turtle.forward()
        end
end
 
-- Start building road from Left to Right
function RoadLeftToRight()
        -- since were starting at h0 of the road, move up 1
        -- need to be facing to the right
        turtle.select(9)
        turtle.placeDown()
        turtle.select(5)
        DetectDigForward()
        turtle.down()
        -- first road block
        turtle.digDown()
        turtle.placeDown()
        DetectDigForward()
        -- second road block
        turtle.digDown()
        turtle.placeDown()
        DetectDigForward()
        -- third road block
        turtle.digDown()
        turtle.placeDown()
        DetectDigForward()
        -- up for next block
        turtle.up()
        turtle.select(9)
        turtle.placeDown()
end
 
-- Turn at end of the Left Row
function EndOfLeftRow()
        turtle.turnLeft()
        DetectDigForward() --row 2 block 5
        turtle.turnLeft()
end
 
-- Start building road from Right to Left
function RoadRightToLeft()
        -- We're at row 2 block 5 in theory
        -- need to be facing to the left
        turtle.select(9)
        turtle.placeDown()
        turtle.select(5)
        turtle.forward()
        turtle.down()
        -- first road block
        turtle.digDown()
        turtle.placeDown()
        turtle.forward()
        -- second road block
        turtle.digDown()
        turtle.placeDown()
        turtle.forward()
        -- third road block
        turtle.digDown()
        turtle.placeDown()
        turtle.forward()
        -- up for next block
        turtle.up()
        turtle.select(9)
        turtle.placeDown()
end
 
-- Turn at the end of the Right Row
function EndOfRightRow()
        turtle.turnRight()
        DetectDigForward()
        turtle.turnRight()
end
 
-- Initial start. Move to beginning of row.
-- (what would be block 3/5)
turtle.turnLeft()
DetectDigForward() --block 2
DetectDigForward() --block 1
turtle.up()
turtle.turnRight()
turtle.turnRight()
 
-- do 10 rows
while x < 10 do
        RoadLeftToRight()
        EndOfLeftRow()
        RoadRightToLeft()
        EndOfRightRow()
        x = x + 1
end
turtle.turnLeft()
DetectDigForward --block 3
DetectDigForward --block 2
DetectDigForward --block 1


function RoadLeftToRight	
