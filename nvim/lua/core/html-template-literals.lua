local M = {}

M.setup = function()
	-- Enable css syntax for `css` tagged template literals
	vim.cmd([[
    let g:htl_css_templates = 1
  ]])
end

return M
