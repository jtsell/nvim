require('neuron').setup {
  virtual_titles = false,
  mappings = false,
  run = nil,
  neuron_dir = "/Users/jeff/Documents/neuron",
  -- leader = "gz",
  -- print('zetteld')
}


function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

dump(require('neuron'))

function Neuron_Map (binding, command)
  local full_command = (':lua require("neuron/cmd").' .. command .. '<CR>')
  vim.api.nvim_set_keymap('n', binding, full_command, {noremap=true})
end

-- Neuron_Map('<Leader>zn', 'new_edit')
vim.api.nvim_set_keymap('n', '<Leader>zn', ':lua require("neuron/cmd").new_edit("~/Documents/neuron")<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<Leader>zt', ':lua require("neuron/telescope").find_tags()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<Leader>zf', ':lua require("neuron/telescope").find_zettels{}<CR>', {noremap=true})
