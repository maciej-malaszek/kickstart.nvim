## Command mode

| Key | Action | Description |
|-----|--------|-------------|
| `<Plug>BlinkCmpDotRepeatHack` | `<Lua callback>` |  |
| `<C-Y>` | `<Lua callback>` | blink.cmp |
| `<C-P>` | `<Lua callback>` | blink.cmp |
| `<C-E>` | `<Lua callback>` | blink.cmp |
| `<C-Space>` | `<Lua callback>` | blink.cmp |
| `<S-Tab>` | `<Lua callback>` | blink.cmp |
| `<Right>` | `<Lua callback>` | blink.cmp |
| `<Left>` | `<Lua callback>` | blink.cmp |
| `<C-N>` | `<Lua callback>` | blink.cmp |
| `<Plug>luasnip-expand-repeat` | `<Lua callback>` | LuaSnip: Repeat last node expansion |
| `<Plug>luasnip-delete-check` | `<Lua callback>` | LuaSnip: Removes current snippet from jumplist |
| `<Plug>(TelescopeFuzzyCommandSearch)` | `<C-\>e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"<CR><CR>` |  |
| `<Tab>` | `<Lua callback>` | blink.cmp |


## Normal mode

| Key | Action | Description |
|-----|--------|-------------|
| `<Esc>` | `<Cmd>nohlsearch<CR>` |  |
| ` mi` | `:MasonInstallAll<CR>` |  |
| ` Shn` | `<Lua callback>` | Highlight next surrounding |
| ` SFn` | `<Lua callback>` | Find next left surrounding |
| ` Sfn` | `<Lua callback>` | Find next right surrounding |
| ` Srn` | `<Lua callback>` | Replace next surrounding |
| ` Sdn` | `<Lua callback>` | Delete next surrounding |
| ` Shl` | `<Lua callback>` | Highlight previous surrounding |
| ` SFl` | `<Lua callback>` | Find previous left surrounding |
| ` Sfl` | `<Lua callback>` | Find previous right surrounding |
| ` Srl` | `<Lua callback>` | Replace previous surrounding |
| ` Sdl` | `<Lua callback>` | Delete previous surrounding |
| ` Sn` | `<Lua callback>` | Update `MiniSurround.config.n_lines` |
| ` Sh` | `<Lua callback>` | Highlight surrounding |
| ` SF` | `<Lua callback>` | Find left surrounding |
| ` Sf` | `<Lua callback>` | Find right surrounding |
| ` Sr` | `<Lua callback>` | Replace surrounding |
| ` Sd` | `<Lua callback>` | Delete surrounding |
| ` Sa` | `<Lua callback>` | Add surrounding |
| ` to` | `<Lua callback>` | Show test output |
| ` tf` | `<Lua callback>` | Run file tests |
| ` tt` | `<Lua callback>` | Run nearest test |
| ` sn` | `<Lua callback>` | [S]earch [N]eovim files |
| ` s/` | `<Lua callback>` | [S]earch [/] in Open Files |
| ` /` | `<Lua callback>` | [/] Fuzzily search in current buffer |
| `  ` | `<Lua callback>` | [ ] Find existing buffers |
| ` s.` | `<Lua callback>` | [S]earch Recent Files ("." for repeat) |
| ` sr` | `<Lua callback>` | [S]earch [R]esume |
| ` sd` | `<Lua callback>` | [S]earch [D]iagnostics |
| ` sg` | `<Lua callback>` | [S]earch by [G]rep |
| ` sw` | `<Lua callback>` | [S]earch current [W]ord |
| ` ss` | `<Lua callback>` | [S]earch [S]elect Telescope |
| ` sf` | `<Lua callback>` | [S]earch [F]iles |
| ` sk` | `<Lua callback>` | [S]earch [K]eymaps |
| ` sh` | `<Lua callback>` | [S]earch [H]elp |
| ` du` | `<Lua callback>` | Toggle DAP UI |
| ` dk` | `<Lua callback>` | Go up stack frame |
| ` dj` | `<Lua callback>` | Go down stack frame |
| ` dr` | `<Lua callback>` | Toggle DAP REPL |
| ` dC` | `<Lua callback>` | Run to cursor |
| ` dO` | `<Lua callback>` | Step over (alt) |
| ` b` | `<Lua callback>` | Toggle breakpoint |
| ` f` | `<Lua callback>` | [F]ormat buffer |
| ` q` | `<Lua callback>` | Open diagnostic [Q]uickfix list |
| `%` | `<Plug>(MatchitNormalForward)` |  |
| `&` | `:&&<CR>` | :help &-default |
| `Y` | `y$` | :help Y-default |
| `[%` | `<Plug>(MatchitNormalMultiBackward)` |  |
| `[ ` | `<Lua callback>` | Add empty line above cursor |
| `[B` | `<Lua callback>` | :brewind |
| `[b` | `<Lua callback>` | :bprevious |
| `[<C-T>` | `<Lua callback>` |  :ptprevious |
| `[T` | `<Lua callback>` | :trewind |
| `[t` | `<Lua callback>` | :tprevious |
| `[A` | `<Lua callback>` | :rewind |
| `[a` | `<Lua callback>` | :previous |
| `[<C-L>` | `<Lua callback>` | :lpfile |
| `[L` | `<Lua callback>` | :lrewind |
| `[l` | `<Lua callback>` | :lprevious |
| `[<C-Q>` | `<Lua callback>` | :cpfile |
| `[Q` | `<Lua callback>` | :crewind |
| `[q` | `<Lua callback>` | :cprevious |
| `[D` | `<Lua callback>` | Jump to the first diagnostic in the current buffer |
| `[d` | `<Lua callback>` | Jump to the previous diagnostic in the current buffer |
| `\` | `:Neotree reveal<CR>` | NeoTree reveal |
| `]%` | `<Plug>(MatchitNormalMultiForward)` |  |
| `] ` | `<Lua callback>` | Add empty line below cursor |
| `]B` | `<Lua callback>` | :blast |
| `]b` | `<Lua callback>` | :bnext |
| `]<C-T>` | `<Lua callback>` | :ptnext |
| `]T` | `<Lua callback>` | :tlast |
| `]t` | `<Lua callback>` | :tnext |
| `]A` | `<Lua callback>` | :last |
| `]a` | `<Lua callback>` | :next |
| `]<C-L>` | `<Lua callback>` | :lnfile |
| `]L` | `<Lua callback>` | :llast |
| `]l` | `<Lua callback>` | :lnext |
| `]<C-Q>` | `<Lua callback>` | :cnfile |
| `]Q` | `<Lua callback>` | :clast |
| `]q` | `<Lua callback>` | :cnext |
| `]D` | `<Lua callback>` | Jump to the last diagnostic in the current buffer |
| `]d` | `<Lua callback>` | Jump to the next diagnostic in the current buffer |
| `g%` | `<Plug>(MatchitNormalBackward)` |  |
| `g]` | `<Lua callback>` | Move to right "around" |
| `g[` | `<Lua callback>` | Move to left "around" |
| `gO` | `<Lua callback>` | vim.lsp.buf.document_symbol() |
| `grt` | `<Lua callback>` | vim.lsp.buf.type_definition() |
| `gri` | `<Lua callback>` | vim.lsp.buf.implementation() |
| `grr` | `<Lua callback>` | vim.lsp.buf.references() |
| `gra` | `<Lua callback>` | vim.lsp.buf.code_action() |
| `grn` | `<Lua callback>` | vim.lsp.buf.rename() |
| `gcc` | `<Lua callback>` | Toggle comment line |
| `gc` | `<Lua callback>` | Toggle comment |
| `gx` | `<Lua callback>` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `q` | `<Lua callback>` | Terminate and clear breakpoints |
| `<Plug>BlinkCmpDotRepeatHack` | `<Lua callback>` |  |
| `<Plug>(MatchitNormalMultiForward)` | `:<C-U>call matchit#MultiMatch("W",  "n")<CR>` |  |
| `<Plug>(MatchitNormalMultiBackward)` | `:<C-U>call matchit#MultiMatch("bW", "n")<CR>` |  |
| `<Plug>(MatchitNormalBackward)` | `:<C-U>call matchit#Match_wrapper('',0,'n')<CR>` |  |
| `<Plug>(MatchitNormalForward)` | `:<C-U>call matchit#Match_wrapper('',1,'n')<CR>` |  |
| `<Plug>luasnip-expand-repeat` | `<Lua callback>` | LuaSnip: Repeat last node expansion |
| `<Plug>luasnip-delete-check` | `<Lua callback>` | LuaSnip: Removes current snippet from jumplist |
| `<C-P>` | `<Lua callback>` |  |
| `<Plug>PlenaryTestFile` | `:lua require('plenary.test_harness').test_file(vim.fn.expand("%:p"))<CR>` |  |
| `<F12>` | `<Lua callback>` | Step out |
| `<F11>` | `<Lua callback>` | Step into |
| `<F10>` | `<Lua callback>` | Step over |
| `<F5>` | `<Lua callback>` | Start/continue debugging |
| `<C-K>` | `<C-W><C-K>` | Move focus to the upper window |
| `<C-J>` | `<C-W><NL>` | Move focus to the lower window |
| `<C-H>` | `<C-W><C-H>` | Move focus to the left window |
| `<C-W><C-D>` | `<C-W>d` | Show diagnostics under the cursor |
| `<C-W>d` | `<Lua callback>` | Show diagnostics under the cursor |
| `<C-L>` | `<C-W><C-L>` | Move focus to the right window |


## Select mode

| Key | Action | Description |
|-----|--------|-------------|
| `<Tab>` | `<Lua callback>` | vim.snippet.jump if active, otherwise <Tab> |
| ` f` | `<Lua callback>` | [F]ormat buffer |
| `<Plug>BlinkCmpDotRepeatHack` | `<Lua callback>` |  |
| `<Plug>luasnip-jump-prev` | `<Lua callback>` | LuaSnip: Jump to the previous node |
| `<Plug>luasnip-jump-next` | `<Lua callback>` | LuaSnip: Jump to the next node |
| `<Plug>luasnip-prev-choice` | `<Lua callback>` | LuaSnip: Change to the previous choice from the choiceNode |
| `<Plug>luasnip-next-choice` | `<Lua callback>` | LuaSnip: Change to the next choice from the choiceNode |
| `<Plug>luasnip-expand-snippet` | `<Lua callback>` | LuaSnip: Expand the current snippet |
| `<Plug>luasnip-expand-or-jump` | `<Lua callback>` | LuaSnip: Expand or jump in the current snippet |
| `<Plug>luasnip-expand-repeat` | `<Lua callback>` | LuaSnip: Repeat last node expansion |
| `<S-Tab>` | `<Lua callback>` | vim.snippet.jump if active, otherwise <S-Tab> |
| `<C-S>` | `<Lua callback>` | vim.lsp.buf.signature_help() |


## Operator-pending mode

| Key | Action | Description |
|-----|--------|-------------|
| ` f` | `<Lua callback>` | [F]ormat buffer |
| `%` | `<Plug>(MatchitOperationForward)` |  |
| `[%` | `<Plug>(MatchitOperationMultiBackward)` |  |
| `]%` | `<Plug>(MatchitOperationMultiForward)` |  |
| `al` | `<Lua callback>` | Around last textobject |
| `an` | `<Lua callback>` | Around next textobject |
| `a` | `<Lua callback>` | Around textobject |
| `g%` | `<Plug>(MatchitOperationBackward)` |  |
| `g]` | `<Lua callback>` | Move to right "around" |
| `g[` | `<Lua callback>` | Move to left "around" |
| `gc` | `<Lua callback>` | Comment textobject |
| `il` | `<Lua callback>` | Inside last textobject |
| `in` | `<Lua callback>` | Inside next textobject |
| `i` | `<Lua callback>` | Inside textobject |
| `<Plug>(MatchitOperationMultiForward)` | `:<C-U>call matchit#MultiMatch("W",  "o")<CR>` |  |
| `<Plug>(MatchitOperationMultiBackward)` | `:<C-U>call matchit#MultiMatch("bW", "o")<CR>` |  |
| `<Plug>(MatchitOperationBackward)` | `:<C-U>call matchit#Match_wrapper('',0,'o')<CR>` |  |
| `<Plug>(MatchitOperationForward)` | `:<C-U>call matchit#Match_wrapper('',1,'o')<CR>` |  |
| `<Plug>luasnip-expand-repeat` | `<Lua callback>` | LuaSnip: Repeat last node expansion |


## Visual Block mode

| Key | Action | Description |
|-----|--------|-------------|
| ` Sa` | `:<C-U>lua MiniSurround.add('visual')<CR>` | Add surrounding to selection |
| ` f` | `<Lua callback>` | [F]ormat buffer |
| `#` | `<Lua callback>` | :help v_#-default |
| `%` | `<Plug>(MatchitVisualForward)` |  |
| `*` | `<Lua callback>` | :help v_star-default |
| `@` | `mode() ==# 'V' ? ':normal! @'.getcharstr().'<CR>' : '@'` | :help v_@-default |
| `Q` | `mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'` | :help v_Q-default |
| `[%` | `<Plug>(MatchitVisualMultiBackward)` |  |
| `]%` | `<Plug>(MatchitVisualMultiForward)` |  |
| `a%` | `<Plug>(MatchitVisualTextObject)` |  |
| `al` | `<Lua callback>` | Around last textobject |
| `an` | `<Lua callback>` | Around next textobject |
| `a` | `<Lua callback>` | Around textobject |
| `g%` | `<Plug>(MatchitVisualBackward)` |  |
| `g]` | `<Lua callback>` | Move to right "around" |
| `g[` | `<Lua callback>` | Move to left "around" |
| `gra` | `<Lua callback>` | vim.lsp.buf.code_action() |
| `gc` | `<Lua callback>` | Toggle comment |
| `gx` | `<Lua callback>` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `il` | `<Lua callback>` | Inside last textobject |
| `in` | `<Lua callback>` | Inside next textobject |
| `i` | `<Lua callback>` | Inside textobject |
| `<Plug>BlinkCmpDotRepeatHack` | `<Lua callback>` |  |
| `<Plug>(MatchitVisualTextObject)` | `<Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)` |  |
| `<Plug>(MatchitVisualMultiForward)` | `:<C-U>call matchit#MultiMatch("W",  "n")<CR>m'gv``` |  |
| `<Plug>(MatchitVisualMultiBackward)` | `:<C-U>call matchit#MultiMatch("bW", "n")<CR>m'gv``` |  |
| `<Plug>(MatchitVisualBackward)` | `:<C-U>call matchit#Match_wrapper('',0,'v')<CR>m'gv``` |  |
| `<Plug>(MatchitVisualForward)` | `:<C-U>call matchit#Match_wrapper('',1,'v')<CR>:if col("''") != col("$") \| exe ":normal! m'" \| endif<CR>gv``` |  |
| `<Plug>luasnip-expand-repeat` | `<Lua callback>` | LuaSnip: Repeat last node expansion |


## Terminal mode

| Key | Action | Description |
|-----|--------|-------------|
| `<Esc><Esc>` | `<C-\><C-N>` | Exit terminal mode |
| `<Plug>BlinkCmpDotRepeatHack` | `<Lua callback>` |  |


## Visual mode

| Key | Action | Description |
|-----|--------|-------------|
| `<Tab>` | `<Lua callback>` | vim.snippet.jump if active, otherwise <Tab> |
| ` Sa` | `:<C-U>lua MiniSurround.add('visual')<CR>` | Add surrounding to selection |
| ` f` | `<Lua callback>` | [F]ormat buffer |
| `#` | `<Lua callback>` | :help v_#-default |
| `%` | `<Plug>(MatchitVisualForward)` |  |
| `*` | `<Lua callback>` | :help v_star-default |
| `@` | `mode() ==# 'V' ? ':normal! @'.getcharstr().'<CR>' : '@'` | :help v_@-default |
| `Q` | `mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q'` | :help v_Q-default |
| `[%` | `<Plug>(MatchitVisualMultiBackward)` |  |
| `]%` | `<Plug>(MatchitVisualMultiForward)` |  |
| `a%` | `<Plug>(MatchitVisualTextObject)` |  |
| `al` | `<Lua callback>` | Around last textobject |
| `an` | `<Lua callback>` | Around next textobject |
| `a` | `<Lua callback>` | Around textobject |
| `g%` | `<Plug>(MatchitVisualBackward)` |  |
| `g]` | `<Lua callback>` | Move to right "around" |
| `g[` | `<Lua callback>` | Move to left "around" |
| `gra` | `<Lua callback>` | vim.lsp.buf.code_action() |
| `gc` | `<Lua callback>` | Toggle comment |
| `gx` | `<Lua callback>` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `il` | `<Lua callback>` | Inside last textobject |
| `in` | `<Lua callback>` | Inside next textobject |
| `i` | `<Lua callback>` | Inside textobject |
| `<Plug>BlinkCmpDotRepeatHack` | `<Lua callback>` |  |
| `<Plug>(MatchitVisualTextObject)` | `<Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward)` |  |
| `<Plug>(MatchitVisualMultiForward)` | `:<C-U>call matchit#MultiMatch("W",  "n")<CR>m'gv``` |  |
| `<Plug>(MatchitVisualMultiBackward)` | `:<C-U>call matchit#MultiMatch("bW", "n")<CR>m'gv``` |  |
| `<Plug>(MatchitVisualBackward)` | `:<C-U>call matchit#Match_wrapper('',0,'v')<CR>m'gv``` |  |
| `<Plug>(MatchitVisualForward)` | `:<C-U>call matchit#Match_wrapper('',1,'v')<CR>:if col("''") != col("$") \| exe ":normal! m'" \| endif<CR>gv``` |  |
| `<Plug>luasnip-jump-prev` | `<Lua callback>` | LuaSnip: Jump to the previous node |
| `<Plug>luasnip-jump-next` | `<Lua callback>` | LuaSnip: Jump to the next node |
| `<Plug>luasnip-prev-choice` | `<Lua callback>` | LuaSnip: Change to the previous choice from the choiceNode |
| `<Plug>luasnip-next-choice` | `<Lua callback>` | LuaSnip: Change to the next choice from the choiceNode |
| `<Plug>luasnip-expand-snippet` | `<Lua callback>` | LuaSnip: Expand the current snippet |
| `<Plug>luasnip-expand-or-jump` | `<Lua callback>` | LuaSnip: Expand or jump in the current snippet |
| `<Plug>luasnip-expand-repeat` | `<Lua callback>` | LuaSnip: Repeat last node expansion |
| `<S-Tab>` | `<Lua callback>` | vim.snippet.jump if active, otherwise <S-Tab> |
| `<C-S>` | `<Lua callback>` | vim.lsp.buf.signature_help() |


## Insert mode

| Key | Action | Description |
|-----|--------|-------------|
| `<Plug>BlinkCmpDotRepeatHack` | `<Lua callback>` |  |
| `<Plug>luasnip-expand-repeat` | `<Lua callback>` | LuaSnip: Repeat last node expansion |
| `<Plug>luasnip-delete-check` | `<Lua callback>` | LuaSnip: Removes current snippet from jumplist |
| `<Plug>luasnip-jump-prev` | `<Lua callback>` | LuaSnip: Jump to the previous node |
| `<Plug>luasnip-jump-next` | `<Lua callback>` | LuaSnip: Jump to the next node |
| `<Plug>luasnip-prev-choice` | `<Lua callback>` | LuaSnip: Change to the previous choice from the choiceNode |
| `<Plug>luasnip-next-choice` | `<Lua callback>` | LuaSnip: Change to the next choice from the choiceNode |
| `<Plug>luasnip-expand-snippet` | `<Lua callback>` | LuaSnip: Expand the current snippet |
| `<Plug>luasnip-expand-or-jump` | `<Lua callback>` | LuaSnip: Expand or jump in the current snippet |
| `<S-Tab>` | `<Lua callback>` | vim.snippet.jump if active, otherwise <S-Tab> |
| `<C-S>` | `<Lua callback>` | vim.lsp.buf.signature_help() |
| `<C-W>` | `<C-G>u<C-W>` | :help i_CTRL-W-default |
| `<C-U>` | `<C-G>u<C-U>` | :help i_CTRL-U-default |
| `<Tab>` | `<Lua callback>` | vim.snippet.jump if active, otherwise <Tab> |

