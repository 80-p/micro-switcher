VERSION = "1.0.0"

local config = import("micro/config")
local buffer = import("micro/buffer")

function init()
    config.MakeCommand("switch", switchCommand, config.NoComplete)
    config.TryBindKey("CtrlSpace", "command:switch", false)
end

function switchCommand(bp)
    if bp.Cursor:HasSelection() == true then
        local temp = buffer.Loc(bp.Cursor.CurSelection[1].X, bp.Cursor.CurSelection[1].Y)
        local temp2 = buffer.Loc(bp.Cursor.CurSelection[2].X, bp.Cursor.CurSelection[2].Y)
        if bp.Cursor.CurSelection[2]:GreaterThan(buffer.Loc(bp.Cursor.OrigSelection[1].X, bp.Cursor.OrigSelection[1].Y)) then
            bp.Cursor.OrigSelection[1] = temp2
            bp.Cursor.X = temp.X
            bp.Cursor.Y = temp.Y
        else
            bp.Cursor.OrigSelection[1] = temp
            bp.Cursor.X = temp2.X
            bp.Cursor.Y = temp2.Y
        end
    end
end
