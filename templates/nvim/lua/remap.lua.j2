vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

local function vimgrep_current_word()
    -- Get the current word under the cursor
    local current_word = vim.fn.expand("<cword>")
    -- Run vimgrep with the current word in all files in the current directory
    vim.cmd("vimgrep /" .. current_word .. "/ `find . -type f`")
    -- Open the quickfix list
    vim.cmd("copen")

    -- Prompt the user for the new word
    local new_word = vim.fn.input("Replace with: ")
    -- Run :cdo command to replace current_word with new_word
    vim.cmd("cdo %s/" .. current_word .. "/" .. new_word .. "/gc")
end
vim.keymap.set("n", "<leader>rnl", vimgrep_current_word, { silent = true })

local function vimgrep_current_word()
    -- Get the current word under the cursor
    local current_word = vim.fn.expand("<cword>")
    -- Run vimgrep with the current word in all files in the current directory
    vim.cmd("vimgrep /" .. current_word .. "/ %")
    -- Open the quickfix list
    vim.cmd("copen")

    -- Prompt the user for the new word
    local new_word = vim.fn.input("Replace with: ")
    -- Run :cdo command to replace current_word with new_word
    vim.cmd("cdo %s/" .. current_word .. "/" .. new_word .. "/gc")
end
vim.keymap.set("n", "<leader>rnf", vimgrep_current_word, { silent = true })
