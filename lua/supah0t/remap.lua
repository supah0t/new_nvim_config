local key = vim.keymap

-- for vim commands to work when keyboard is greek
vim.opt.langmap ="ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz"

-- general life improvements
vim.g.mapleader = " "
key.set("n", "<leader>pv", vim.cmd.Ex)
key.set("i", "jk", "<Esc>")
key.set("n", "<CR>", ":noh<cr>", { noremap = true, silent = true })
key.set({ 'n', 'v' }, 'K', '{', { noremap = true })
key.set({ 'n', 'v' }, 'J', '}', { noremap = true })
key.set("n", "L", "$", { noremap = true })
key.set("n", "H", "^", { noremap = true })
key.set("n", "<leader>ll", ":join<cr>", { noremap = true, silent = true })

key.set('n', '<leader>z', '<C-w>r<cr>', { noremap = true })
-- not much point with lua setup
key.set('n', '<leader>,', ':tabnew $MYVIMRC<cr>', { noremap = true })

-- copy-paste with clipboard
key.set('v', '<leader>y', '"+y', { noremap = true })
key.set('n', '<leader>p', '"+P', {})

-- splits
key.set('n', '<leader>v', ':vsp<cr><C-w><C-w>', { noremap = true })
key.set({ 'n', 'v' }, '<C-j>', '<C-W>j', {})
key.set({ 'n', 'v' }, '<C-k>', '<C-W>k', {})
key.set({ 'n', 'v' }, '<C-h>', '<C-W>h', {})
key.set({ 'n', 'v' }, '<C-l>', '<C-W>l', {})

--tabs
key.set({ 'n', 'v' }, '<SPACE>', '<Nop>', { noremap = true })
key.set('n', '<leader>t', ':tabnew<cr>', { noremap = true })
key.set('n', '<leader>ct', ':tabclose<cr>', { noremap = true })
key.set('n', '<S-TAB>', 'gt')
key.set('n', '<leader>1', '1gt', { noremap = true })
key.set('n', '<leader>2', '2gt', { noremap = true })
key.set('n', '<leader>3', '3gt', { noremap = true })
key.set('n', '<leader>4', '4gt', { noremap = true })
key.set('n', '<leader>5', '5gt', { noremap = true })
key.set('n', '<leader>6', '6gt', { noremap = true })
key.set('n', '<leader>7', '7gt', { noremap = true })
key.set('n', '<leader>8', '8gt', { noremap = true })
key.set('n', '<leader>9', '9gt', { noremap = true })
key.set('n', '<leader><left>', ':tabp<cr>', { noremap = true })
key.set('n', '<leader><right>', ':tabn<cr>', { noremap = true })
key.set('n', '<leader><S-Left>', ':-tabm<cr>', { noremap = true })
key.set('n', '<leader><S-Right>', ':+tabm<cr>', { noremap = true })

key.set('n', '<leader>eo', ':e <C-R>=expand("%:p:h") . "/" <CR>', { noremap = true })
key.set('n', '<leader>et', ':tabe <C-R>=expand("%:p:h") . "/" <CR>')
key.set('n', '<leader>ev', ':vsplit <C-R>=expand("%:p:h") . "/" <CR>')
key.set('n', '<leader>es', ':split <C-R>=expand("%:p:h") . "/" <CR>')

key.set({ 'n', 'v' }, 'j', 'gj')
key.set({ 'n', 'v' }, 'k', 'gk')

-- FTerm
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })
key.set('n', '<leader>\'', ':FTermToggle<cr>')

-- diagnostics
key.set('n', '<leader>ee', vim.diagnostic.open_float)
key.set('n', '[d', vim.diagnostic.goto_prev)
key.set('n', ']d', vim.diagnostic.goto_next)
key.set('n', '<leader>q', vim.diagnostic.setloclist)

-- faster resize
key.set('n', '<leader>+', ':vertical resize +10<cr>', { noremap = true })
key.set('n', '<leader>-', ':vertical resize -10<cr>', { noremap = true })

-- undotree
key.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

-- vimwiki
key.set({ 'n', 'v' }, '<C-SPACE>', '<Plug>VimwikiToggleListItem')

-- move lines
key.set('v', '}', ":m '>+1<CR>gv=gv", { noremap = true })
key.set('v', '{', ":m '<-2<CR>gv=gv", { noremap = true })

-- blamer toggle
key.set('n', '<leader>bt', ':BlamerToggle<CR>')

-- lazygit
key.set('n', '<leader>lg', ':LazyGit<CR>')

-- fugitive
key.set('n', '<leader>gd', ':Gdiff<CR>')

-- copy current file to clipboard
key.set('n', '<leader>cf', ':redir @* | echo @% | redir END<CR>')

-- eslint --fix current file
-- key.set('n', '<leader>ec', '!tmux new -d "eslint --fix %"', { noremap = true })
-- vim.api.nvim_create_user_command('Formatd', '!tmux new -d "eslint --fix %"', {})
-- vim.api.nvim_create_user_command('Format', '!eslint --fix %', {})

-- trouble
key.set("n", "<leader>xx", "<cmd>Trouble diagnostics<cr>",
  { silent = true, noremap = true }
)

-- replacer
key.set('n', '<leader>r', ':lua require("replacer").run()<cr>', { silent = true })

-- tstools
key.set('n', '<leader>g', ':TSTools')
