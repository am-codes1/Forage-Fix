# Forage Fix

Fixes an issue in Project Zomboid where a player was getting heavily penalized for being exhausted while foraging.

Problem can be found in `forageSystem.lua:1774`

Problem code is:

`local exhaustionPenalty = math.max(enduranceLevel + fatigueLevel);`

Correct syntax is to comma-separate `enduranceLevel` and `fatigueLevel` so that `math.max` chooses the highest between the two values. Instead, it combines them and chooses between their sum and nothing, meaning you will get a penalty from both instead of just the highest one.
