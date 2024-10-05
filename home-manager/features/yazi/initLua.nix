style: palette:
with style;
with palette;
''
  require("full-border"):setup {
  	type = ui.Border.PLAIN,
  }

  require("yamb"):setup {}

  function Status:name()
    local h = self._tab.current.hovered
    if not h then
      return ui.Line {}
    end

    local linked = ""
    if h.link_to ~= nil then
    	linked = " -> " .. tostring(h.link_to)
    end
    return ui.Line(" " .. h.name .. linked)
  end

  Status:children_add(function()
    local h = cx.active.current.hovered
    if h == nil or ya.target_family() ~= "unix" then
      return ui.Line {}
    end

    return ui.Line {
      ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("#${mauve}"),
      ui.Span(":"):fg("#${secondary_text}"),
      ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("#${mauve}"),
      ui.Span(" "),
    }
  end, 500, Status.RIGHT)

  Header:children_add(function()
    return ui.Span(" ")
  end, 500, Header.LEFT)
''
