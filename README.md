toggl for awesome wm
-------------------

![Screenshot](/screenshot.png?raw=true)




Usage
------

echo myapitoken123 > ~/.toggl



in ~/config/awesome/rc.lua
```
-- create widget for toggle clock
togglwidget = wibox.widget.textbox()
togglwidget.text = ""

right_layout:add(togglwidget)
```

