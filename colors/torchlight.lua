-- Entry point for `:colorscheme torchlight`. Without this file the command
-- fails with E185, even though setup() sets vim.g.colors_name.
-- Naming the palette switches back from a variant. Any other option already
-- given to setup(), such as contrast, is preserved.
require('torchlight').setup({ palette = 'torchlight' })
