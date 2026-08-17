-- Entry point for `:colorscheme torchlight`. Without this file the command
-- fails with E185, even though setup() sets vim.g.colors_name.
-- Passing no options preserves anything already given to setup().
require('torchlight').setup()
