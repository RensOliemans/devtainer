
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
  use 'SmiteshP/nvim-navic'
  use 'laytan/cloak.nvim'
  use 'kkharji/sqlite.lua'
  use 'petertriho/cmp-git'
  use {'catppuccin/vim', as = 'catppuccin'}
  use 'mgedmin/coverage-highlight.vim'
  use 'lewis6991/impatient.nvim'
  use 'navarasu/onedark.nvim'
  use 'mtdl9/vim-log-highlighting'
  use 'AndrewRadev/diffurcate.vim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'andersevenrud/cmp-tmux'
  use 'lukas-reineke/cmp-rg'
  use 'waylonwalker/Telegraph.nvim'
    use {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
    }
  use 'ThePrimeagen/vim-be-good'
  use 'jbyuki/instant.nvim'
  use 'windwp/nvim-spectre'
  use 'Th3Whit3Wolf/onebuddy'
  use 'hoob3rt/lualine.nvim'
  use 'mhinz/vim-signify'
  use 'tjdevries/colorbuddy.nvim'
  use 'ambv/black'
  use 'christoomey/vim-quicklink'
  use 'christoomey/vim-tmux-runner'
  use 'fabi1cazenave/termopen.vim'
  use {'junegunn/fzf', run = ':call fzf#install()'  }
  use 'junegunn/fzf.vim'
  use 'justinmk/vim-sneak'
  use 'mbbill/undotree'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'smitajit/bufutils.vim'
  use 'voldikss/vim-floaterm'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use 'tpope/vim-repeat'
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
  use 'thinca/vim-visualstar'
  use 'wellle/targets.vim'
  use 'tpope/vim-commentary'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-compe'
  use 'kabouzeid/nvim-lspinstall'
  use 'michaeljsmith/vim-indent-object'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'
  use 'ray-x/lsp_signature.nvim'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'nvim-neotest/neotest'
  use 'eddyekofo94/gruvbox-flat.nvim'
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'mfussenegger/nvim-dap-python'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip/'
  use '/norcalli/snippets.nvim'
  use 'rafamadriz/friendly-snippets'
  use 'ckipp01/stylua-nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'neovim/nvim-lspconfig'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
