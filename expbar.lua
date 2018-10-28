local math = require('math')
local player = require('player')
local resources = require('resources')
local string = require('string')
local ui = require('ui')
local windower = require('windower')

local window_state = {
    title = 'Exp Bar',
    style = 'chromeless',
    x = math.floor(windower.settings.ui_size.width / 2) - 350,
    y = 1,
    width = 700,
    height = 16,
    color = ui.color.rgb(0,0,0,0)
}

ui.display(function()
    window_state = ui.window('expbar_window', window_state, function()
        local exp_percent = player.exp / player.exp_required

        --Show jobs and levels
        ui.location(0,0)
        ui.text(string.format('[%s%d/%s%d]{bold color:%s stroke:"%s"}',
            resources.jobs[player.main_job_id].ens, player.main_job_level,
            resources.jobs[player.sub_job_id].ens, player.sub_job_level,
            'khaki', '1px black'))

        ui.location(100, 5)
        ui.size(500, 2)
        ui.progress(exp_percent, {color = ui.color.khaki})

        --Show current/required/percent exp
        ui.location(605,0)
        ui.text(string.format('[%s/%s(%s%%)]{bold color:%s stroke:"%s"}',
            player.exp, player.exp_required,
            math.floor(exp_percent*100),
            'khaki', '1px black'))
    end)
end)
