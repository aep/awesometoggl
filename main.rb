require 'togglv8'
toggl = TogglV8::API.new

c = toggl.get_current_time_entry
p c
text = ""
if (c)
    if (c['pid'])
        p = toggl.get_project(c['pid']);
        text += "<span color='#{p['hex_color']}'> &#11044; #{p['name']}</span> "
    else
        text += "no project "
    end

    if (c['billable'])
        text += "<span color='#0f0'>$$</span> "
    else
        text += "<span color='#666'>$$</span> "
    end

    running = Time.now().to_i + c['duration']
    text += "<span color='#999'>"
    text += Time.at(running).utc.strftime("%H:%M:%S") + "</span>"

    text += " "
else
    text += " <span color='#666'>&#11044; free </span>"
end

IO.popen("awesome-client", "w") { |f|
    f.write 'togglwidget:set_markup("' + text + '")'
    f.close
}

