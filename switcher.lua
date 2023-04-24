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

        --bp.Cursor.Y = temp3 + 4
        --bp.Cursor:Right()
            --bp.Cursor:ResetSelection()
        --bp.Buf:Insert(bp.Cursor.CurSelection[1], tostring(temp3))
        --bp.Cursor:ResetSelection()
        --bp.Cursor:Deselect(true)
        --bp.Cursor:SelectTo(buffer.Loc(temp, temp3))
        --bp.Cursor.CurSelection[1].X = temp
        --bp.Cursor.CurSelection[1].Y = temp3
        --bp.Cursor.X = bp.Cursor.X + 5
        --bp.Cursor.CurSelection[1].X = bp.Cursor.Loc.X
        --bp.Cursor.CurSelection[2].X = temp
        --bp.Cursor.X = bp.Cursor.CurSelection[1].X
        --local temp2 = {bp.Cursor.CurSelection[2].X, bp.Cursor.CurSelection[2].Y}
        --local temp3 = temp2 - temp
        --bp.Cursor.SetSelectionEnd(bp.Cursor, temp2)
        --bp.Cursor.SetSelectionStart(bp.Cursor, temp)
        --bp.Cursor.CurSelection[2].X = bp.Cursor.CurSelection[2].X - 1
        --bp.Cursor.CurSelection[1].X = bp.Cursor.CurSelection[1].X - 5
        --bp.Cursor.X = bp.Cursor.X + 5
        --bp.Cursor:SetSelectionStart({5,5})
        --bp.Cursor:SetSelectionEnd({3,5})
        --bp.Cursor:GotoLoc(buffer.Loc(temp, temp3))
        --bp.Cursor.OrigSelection = [buffer]
        --bp.Cursor:GotoLoc(buffer.Loc(temp, temp3))
        --bp.Cursor.OrigSelection[1] = buffer.Loc(temp, temp3)
