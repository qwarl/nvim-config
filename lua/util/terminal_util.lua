local M = {}

function M.match_terminal(target_terminal)
	local current_terminal = os.getenv("TERM") or nil
  local tmux_client_terminal = M.get_tmux_client_terminal()

	-- check if tmux is running, check what terminal is tmux running on
	if current_terminal == "tmux-256color" then
		return M.is_terminal_matching(tmux_client_terminal, target_terminal)
	end

	return M.is_terminal_matching(current_terminal, target_terminal)
end

-- check if that terminal can use kitty as backend for better performance
function M.is_terminal_matching(current_terminal, name)
	return string.match(current_terminal, name) ~= nil
end

-- if tmux is running, get the terminal name
function M.get_tmux_client_terminal()
	local handle = io.popen('tmux display-message -p "#{client_termname}"')
	local result = handle:read("*a")

	result = result:gsub("%s+$", "") -- Remove trailing whitespace
	handle:close() -- It's a good practice to close the handle
	return result
end

return M
