return {
  {
    "andweeb/presence.nvim",
    config = function()
      local presence = require("presence");
      presence.setup({ enable_line_number = true })
    end
  }
}
