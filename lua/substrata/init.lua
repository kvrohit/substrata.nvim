local c = require('substrata.colors')
local utils = require('substrata.utils')
local M = {}

local set_terminal_colors = function()
    vim.g.terminal_color_0 = c.bg2
    vim.g.terminal_color_1 = c.cyan
    vim.g.terminal_color_2 = c.green
    vim.g.terminal_color_3 = c.blue
    vim.g.terminal_color_4 = c.blue
    vim.g.terminal_color_5 = c.pink
    vim.g.terminal_color_6 = c.blue
    vim.g.terminal_color_7 = c.blue
    vim.g.terminal_color_8 = c.yellow
    vim.g.terminal_color_9 = c.red
    vim.g.terminal_color_10 = c.green
    vim.g.terminal_color_11 = c.cyan
    vim.g.terminal_color_12 = c.cyan
    vim.g.terminal_color_13 = c.pink
    vim.g.terminal_color_14 = c.green
    vim.g.terminal_color_15 = c.blue
    vim.g.terminal_color_background = c.bg0
    vim.g.terminal_color_foreground = c.fg
end

local set_groups = function()
    local groups = {
        -- Base
        -- Editor highlight groups
        Normal = {fg = c.fg, bg = c.bg0}, -- normal text and background color
        SignColumn = {fg = c.fg, bg = c.bg0},
        EndOfBuffer = {fg = c.disabled}, -- ~ lines at the end of a buffer
        NormalFloat = {fg = c.fg, bg = c.bg2}, -- normal text and background color for floating windows
        FloatBorder = {fg = c.blue, bg = c.bg2},
        ColorColumn = {fg = c.none, bg = c.bg1}, --  used for the columns set with 'colorcolumn'
        Conceal = {fg = c.gray}, -- placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor = {fg = c.cyan, bg = c.none, style = "reverse"}, -- the character under the cursor
        CursorIM = {fg = c.cyan, bg = c.none, style = "reverse"}, -- like Cursor, but used when in IME mode
        Directory = {fg = c.blue, bg = c.none, style = "bold"}, -- directory names (and other special names in listings)
        DiffAdd = {fg = c.light_green, bg = c.none, style = "reverse"}, -- diff mode: Added line
        DiffChange = {fg = c.light_blue, bg = c.none, style = "reverse"}, --  diff mode: Changed line
        DiffDelete = {fg = c.light_red, bg = c.none, style = "reverse"}, -- diff mode: Deleted line
        DiffText = {fg = c.fg, bg = c.none, style = "reverse"}, -- diff mode: Changed text within a changed line
        ErrorMsg = {fg = c.red}, -- error messages
        Folded = {fg = c.gray, c.none, style = "italic"},
        FoldColumn = {fg = c.blue},
        IncSearch = {style = "reverse"},
        LineNr = {fg = c.disabled},
        CursorLineNr = {fg = c.gray_alt},
        MatchParen = {fg = c.fg1, style = "bold"},
        ModeMsg = {fg = c.cyan, style = "bold"},
        MoreMsg = {fg = c.cyan, style = "bold"},
        NonText = {fg = c.bg3},
        Pmenu = {fg = c.fg, bg = c.bg4},
        PmenuSel = {fg = c.bg0, bg = c.blue, style = "bold"},
        PmenuSbar = {fg = c.fg, bg = c.bg2},
        PmenuThumb = {fg = c.fg, bg = c.gray},
        Question = {fg = c.green, style = "bold"},
        QuickFixLine = {fg = c.blue, bg = c.bg1, style = "bold,italic"},
        qfLineNr = {fg = c.blue, bg = c.bg1},
        Search = {style = "reverse"},
        SpecialKey = {fg = c.bg3},
        SpellBad = {fg = c.red, bg = c.none, style = "italic,undercurl"},
        SpellCap = {fg = c.blue, bg = c.none, style = "italic,undercurl"},
        SpellLocal = {fg = c.cyan, bg = c.none, style = "italic,undercurl"},
        SpellRare = {fg = c.cyan, bg = c.none, style = "italic,undercurl"},
        StatusLine = {fg = c.blue, bg = c.bg0},
        StatusLineNC = {fg = c.gray},
        StatusLineTerm = {fg = c.fg, bg = c.bg3},
        StatusLineTermNC = {fg = c.fg, bg = c.bg3},
        TabLineFill = {fg = c.gray, bg = c.bg1},
        TablineSel = {fg = c.bg0, bg = c.blue},
        Tabline = {fg = c.gray},
        Title = {fg = c.cyan, bg = c.none, style = "bold"},
        Visual = {fg = c.none, bg = c.bg3},
        VisualNOS = {fg = c.none, bg = c.bg3},
        WarningMsg = {fg = c.red, style = "bold"},
        WildMenu = {fg = c.bg0, bg = c.blue, style = "bold"},
        CursorColumn = {fg = c.none, bg = c.fg},
        CursorLine = {fg = c.none, bg = c.bg1},
        ToolbarLine = {fg = c.fg, bg = c.bg1},
        ToolbarButton = {fg = c.fg, bg = c.none, style = "bold"},
        NormalMode = {fg = c.cyan, bg = c.none, style = "reverse"},
        InsertMode = {fg = c.green, bg = c.none, style = "reverse"},
        VisualMode = {fg = c.cyan, bg = c.none, style = "reverse"},
        VertSplit = {fg = c.gray_alt},
        CommandMode = {fg = c.gray, bg = c.none, style = "reverse"},
        Warnings = {fg = c.red},
        healthError = {fg = c.red},
        healthSuccess = {fg = c.green},
        healthWarning = {fg = c.red},
        --common
        Type = {fg = c.cyan}, -- int, long, char, etc.
        StorageClass = {fg = c.cyan}, -- static, register, volatile, etc.
        Structure = {fg = c.pink}, -- struct, union, enum, etc.
        Constant = {fg = c.pink}, -- any constant
        Comment = {fg = c.gray, bg = c.none, style = "italic"},
        Conditional = {fg = c.blue, bg = c.none, style = "italic"}, -- italic if, then, else, endif, switch, etc.
        Keyword = {fg = c.blue, bg = c.none, style = "italic"}, -- italic for, do, while, etc.
        Repeat = {fg = c.red, bg = c.none, style = "italic"}, -- italic any other keyword
        Boolean = {fg = c.blue, bg = c.none, style = "italic"}, -- true , false
        Function = {fg = c.blue, bg = c.none},
        Identifier = {fg = c.blue, bg = c.none}, -- any variable name
        String = {fg = c.cyan, bg = c.none}, -- Any string
        Character = {fg = c.red}, -- any character constant: 'c', '\n'
        Number = {fg = c.pink}, -- a number constant: 5
        Float = {fg = c.pink}, -- a floating point constant: 2.3e10
        Statement = {fg = c.blue}, -- any statement
        Label = {fg = c.cyan}, -- case, default, etc.
        Operator = {fg = c.gray_alt}, -- sizeof", "+", "*", etc.
        Exception = {fg = c.blue}, -- try, catch, throw
        PreProc = {fg = c.red}, -- generic Preprocessor
        Include = {fg = c.blue}, -- preprocessor #include
        Define = {fg = c.cyan}, -- preprocessor #define
        Macro = {fg = c.blue}, -- same as Define
        Typedef = {fg = c.cyan}, -- A typedef
        PreCondit = {fg = c.cyan}, -- preprocessor #if, #else, #endif, etc.
        Special = {fg = c.blue, bg = c.none, "italic"}, -- any special symbol
        SpecialChar = {fg = c.red}, -- special character in a constant
        Tag = {fg = c.red}, -- you can use CTRL-] on this
        Delimiter = {fg = c.yellow}, -- character that needs attention like , or .
        SpecialComment = {fg = c.blue}, -- special things inside a comment
        Debug = {fg = c.red}, -- debugging statements
        Underlined = {fg = c.cyan, bg = c.none, style = "underline"}, -- text that stands out, HTML links
        Ignore = {fg = c.gray_alt}, -- left blank, hidden
        Error = {fg = c.red, bg = c.none, style = "bold,underline"}, -- any erroneous construct
        Todo = {fg = c.cyan, bg = c.none, style = "bold,italic"}, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        -- HTML
        htmlArg = {fg = c.red},
        htmlBold = {fg = c.red, bg = c.none, style = "bold"},
        htmlEndTag = {fg = c.fg},
        htmlstyle = {fg = c.cyan, bg = c.none, style = "italic"},
        htmlLink = {fg = c.cyan, style = "underline"},
        htmlSpecialChar = {fg = c.red},
        htmlSpecialTagName = {fg = c.blue, style = "bold"},
        htmlTag = {fg = c.fg},
        htmlTagN = {fg = c.blue},
        htmlTagName = {fg = c.blue, "bold"},
        htmlTitle = {fg = c.fg},
        htmlH1 = {fg = c.blue, style = "bold"},
        htmlH2 = {fg = c.blue, style = "bold"},
        htmlH3 = {fg = c.blue, style = "bold"},
        htmlH4 = {fg = c.blue, style = "bold"},
        htmlH5 = {fg = c.blue, style = "bold"},
        -- Markdown
        markdownH1 = {fg = c.blue, style = "bold"},
        markdownH2 = {fg = c.blue, style = "bold"},
        markdownH3 = {fg = c.blue, style = "bold"},
        markdownH4 = {fg = c.blue, style = "bold"},
        markdownH5 = {fg = c.blue, style = "bold"},
        markdownH6 = {fg = c.blue, style = "bold"},
        markdownHeadingDelimiter = {fg = c.red},
        markdownHeadingRule = {fg = c.gray},
        markdownId = {fg = c.cyan},
        markdownIdDeclaration = {fg = c.blue},
        markdownIdDelimiter = {fg = c.cyan},
        markdownstyle = {fg = c.cyan, bg = c.none, style = "italic"},
        markdownLinkDelimiter = {fg = c.cyan},
        markdownLinkText = {fg = c.blue},
        markdownListMarker = {fg = c.red},
        markdownOrderedListMarker = {fg = c.red},
        markdownRule = {fg = c.gray},
        markdownUrl = {fg = c.cyan, bg = c.none, style = "underline"},
        markdownBlockquote = {fg = c.gray},
        markdownBold = {fg = c.red, bg = c.none, style = "bold"},
        markdownCode = {fg = c.pink, bg = c.bg1},
        markdownCodeBlock = {fg = c.green},
        markdownCodeDelimiter = {fg = c.green},
        -- Dashboard
        DashboardShortCut = {fg = c.red},
        DashboardHeader = {fg = c.pink},
        DashboardCenter = {fg = c.blue},
        DashboardFooter = {fg = c.green, style = "italic"},
        -- TreeSitter highlight groups
        TSComment = {fg = c.gray, bg = c.none, style = "italic"}, -- For comment blocks.
        TSConditional = {fg = c.pink}, -- For keywords related to conditionnals.
        TSKeyword = {fg = c.blue}, -- For keywords that don't fall in previous categories.
        TSAnnotation = {fg = red}, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        TSRepeat = {fg = c.blue, style = "italic"}, -- For keywords related to loops.
        TSAttribute = {fg = c.pink}, -- (unstable) TODO: docs
        TSKeywordFunction = {fg = c.blue}, -- For keywords used to define a fuction.
        TSCharacter = {fg = red}, -- For characters.
        TSBoolean = {fg = c.pink, bg = c.none, style = "italic"}, -- true or false
        TSFunction = {fg = c.light_blue, style = "italic"}, -- For fuction (calls and definitions).
        TSMethod = {fg = c.light_blue, style = "italic"}, -- For method calls and definitions.
        TSConstructor = {fg = red}, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        TSFuncBuiltin = {fg = c.red, style = "italic"}, -- For builtin functions: `table.insert` in Lua.
        TSConstant = {fg = c.fg}, -- For constants
        TSVariable = {fg = c.fg}, -- Any variable name that does not have another highlight.
        TSVariableBuiltin = {fg = c.cyan, style = "italic"}, -- Variable names that are defined by the languages, like `this` or `self`.        TSConstBuiltin = {fg = red}, -- For constant that are built in the language: `nil` in Lua.
        TSConstMacro = {fg = c.cyan}, -- For constants that are defined by macros: `NULL` in C.
        TSError = {fg = c.red}, -- For syntax/parser errors.
        TSException = {fg = c.blue}, -- For exception related keywords.
        TSField = {fg = c.blue}, -- For fields.
        TSFloat = {fg = c.pink}, -- For floats.
        TSFuncMacro = {fg = c.blue}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude = {fg = c.blue, style = "italic"}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSLabel = {fg = c.cyan}, -- For labels: `label:` in C and `:label:` in Lua.
        TSNamespace = {fg = c.blue}, -- For identifiers referring to modules and namespaces.
        TSNumber = {fg = c.pink}, -- For all numbers
        TSOperator = {fg = c.gray_alt}, -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter = {fg = c.fg}, -- For parameters of a function.
        TSParameterReference = {fg = c.fg}, -- For references to parameters of a function.
        TSProperty = {fg = c.light_blue}, -- Same as `TSField`.
        TSPunctDelimiter = {fg = c.gray_alt}, -- For delimiters ie: `.`
        TSPunctBracket = {fg = c.gray_alt}, -- For brackets and parens.
        TSPunctSpecial = {fg = c.pink}, -- For special punctutation that does not fall in the catagories before.
        TSString = {fg = c.cyan}, -- For strings.
        TSStringRegex = {fg = c.blue}, -- For regexes.
        TSStringEscape = {fg = c.red}, -- For escape characters within a string.
        TSSymbol = {fg = c.red}, -- For identifiers referring to symbols or atoms.
        TSType = {fg = c.pink}, -- For types.
        TSTypeBuiltin = {fg = c.cyan}, -- For builtin types.
        TSTag = {fg = c.blue}, -- Tags like html tag names.
        TSTagDelimiter = {fg = c.blue}, -- Tag delimiter like `<` `>` `/`
        TSText = {fg = c.pink}, -- For strings considered text in a markup language.
        TSTextReference = {fg = c.red}, -- FIXME
        TSEmphasis = {fg = c.pink}, -- For text to be represented with emphasis.
        TSUnderline = {fg = c.fg, bg = c.none, style = "underline"}, -- For text to be represented with an underline.
        TSStrike = {}, -- For strikethrough text.
        TSTitle = {fg = c.fg, bg = c.none, style = "bold"}, -- Text that is part of a title.
        TSLiteral = {fg = c.fg}, -- Literal text.
        TSURI = {fg = c.pink}, -- Any URL like a link or email.
        --TSNone =                    { },    -- TODO: docs
        -- Lsp highlight groups
        LspDiagnosticsDefaultError = {fg = c.red}, -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError = {fg = c.red}, -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError = {fg = c.red, style = "bold"}, -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError = {fg = c.red, style = "bold"}, -- Virtual text "Error"
        LspDiagnosticsUnderlineError = {fg = c.red, style = "undercurl", sp = c.red}, -- used to underline "Error" diagnostics.
        LspDiagnosticsDefaultWarning = {fg = c.red}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning = {fg = c.red}, -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning = {fg = c.red, style = "bold"}, -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning = {fg = c.red, style = "bold"}, -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning = {fg = c.red, style = "undercurl", sp = c.red}, -- used to underline "Warning" diagnostics.
        LspDiagnosticsDefaultInformation = {fg = c.blue}, -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation = {fg = c.blue}, -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation = {fg = c.blue, style = "bold"}, -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation = {fg = c.blue, style = "bold"}, -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation = {fg = c.blue, style = "undercurl", sp = c.blue}, -- used to underline "Information" diagnostics.
        LspDiagnosticsDefaultHint = {fg = c.cyan}, -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint = {fg = c.cyan}, -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint = {fg = c.cyan, style = "bold"}, -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint = {fg = c.cyan, style = "bold"}, -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint = {fg = c.cyan, style = "undercurl", sp = c.blue}, -- used to underline "Hint" diagnostics.
        LspReferenceText = {fg = c.fg, bg = c.pink}, -- used for highlighting "text" references
        LspReferenceRead = {fg = c.fg, bg = c.pink}, -- used for highlighting "read" references
        LspReferenceWrite = {fg = c.fg, bg = c.pink}, -- used for highlighting "write" references
        -- Plugins highlight groups
        -- LspTrouble
        LspTroubleText = {fg = c.bg4},
        LspTroubleCount = {fg = c.pink, bg = c.bg3},
        LspTroubleNormal = {fg = c.fg, bg = c.bg0},
        -- Diff
        diffAdded = {fg = c.light_green},
        diffRemoved = {fg = c.light_red},
        diffChanged = {fg = c.light_blue},
        diffOldFile = {fg = c.bg4},
        diffNewFile = {fg = c.fg},
        diffFile = {fg = c.gray},
        diffLine = {fg = c.cyan},
        diffIndexLine = {fg = c.pink},
        -- Neogit
        NeogitBranch = {fg = c.gray_alt},
        NeogitRemote = {fg = c.pink},
        NeogitHunkHeader = {fg = c.fg, bg = c.cyan},
        NeogitHunkHeaderHighlight = {fg = c.blue},
        NeogitDiffContextHighlight = {fg = c.fg},
        NeogitDiffDeleteHighlight = {fg = c.red},
        NeogitDiffAddHighlight = {fg = c.green},
        -- GitGutter
        GitGutterAdd = {fg = c.light_green}, -- diff mode: Added line |diff.txt|
        GitGutterChange = {fg = c.light_blue}, -- diff mode: Changed line |diff.txt|
        GitGutterDelete = {fg = c.light_red}, -- diff mode: Deleted line |diff.txt|
        -- GitSigns
        GitSignsAdd = {fg = c.light_green}, -- diff mode: Added line |diff.txt|
        GitSignsAddNr = {fg = c.light_green}, -- diff mode: Added line |diff.txt|
        GitSignsAddLn = {fg = c.light_green}, -- diff mode: Added line |diff.txt|
        GitSignsChange = {fg = c.light_yellow}, -- diff mode: Changed line |diff.txt|
        GitSignsChangeNr = {fg = c.light_yellow}, -- diff mode: Changed line |diff.txt|
        GitSignsChangeLn = {fg = c.light_yellow}, -- diff mode: Changed line |diff.txt|
        GitSignsDelete = {fg = c.light_red}, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteNr = {fg = c.light_red}, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteLn = {fg = c.light_red}, -- diff mode: Deleted line |diff.txt|
        -- vim-signify
        SignifySignAdd = {fg = c.light_green},
        SignifySignChange = {fg = c.light_yellow},
        SignifySignDelete = {fg = c.light_red},
        -- Syntastic
        SyntasticError = {fg = c.red},
        SyntasticWarning = {fg = c.yellow},
        SyntasticErrorSign = {fg = c.red},
        SyntasticWarningSign = {fg = c.yellow},
        -- Telescope
        TelescopePromptBorder = {fg = c.blue},
        TelescopeResultsBorder = {fg = c.gray_alt},
        TelescopePreviewBorder = {fg = c.gray},
        TelescopeMatching = {fg = c.light_green},
        TelescopePromptPrefix = {fg = c.yellow},
        -- Nerdtree
        NERDTreeDir = {fg = c.pink},
        NERDTreeDirSlash = {fg = c.blue},
        NERDTreeOpenable = {fg = c.red},
        NERDTreeClosable = {fg = c.red},
        NERDTreeFile = {fg = c.blue},
        NERDTreeExecFile = {fg = c.green},
        NERDTreeUp = {fg = c.gray},
        NERDTreeCWD = {fg = c.green},
        NERDTreeHelp = {fg = c.gray_alt},
        NERDTreeToggleOn = {fg = c.green},
        NERDTreeToggleOff = {fg = c.red},
        -- NvimTree
        NvimTreeRootFolder = {fg = c.cyan, style = "italic"},
        NvimTreeNormal = {fg = c.fg, bg = c.bg0},
        NvimTreeGitDirty = {fg = c.light_yellow},
        NvimTreeGitNew = {fg = c.green},
        NvimTreeImageFile = {fg = c.pink},
        NvimTreeExecFile = {fg = c.green},
        NvimTreeSpecialFile = {fg = c.yellow, style = "underline"},
        NvimTreeFolderName = {fg = c.blue},
        NvimTreeEmptyFolderName = {fg = c.gray},
        NvimTreeFolderIcon = {fg = c.gray},
        NvimTreeIndentMarker = {fg = c.disabled},
        LspDiagnosticsError = {fg = c.red},
        LspDiagnosticsWarning = {fg = c.red},
        LspDiagnosticsInformation = {fg = c.gray_alt},
        LspDiagnosticsHint = {fg = c.blue},
        -- Ale-vim
        ALEError = {fg = c.red},
        ALEWarning = {fg = c.red},
        ALEInfo = {fg = c.blue},
        ALEErrorSign = {fg = c.red},
        ALEWarningSign = {fg = c.red},
        ALEInfoSign = {fg = c.blue},
        ALEVirtualTextError = {fg = c.red},
        ALEVirtualTextWarning = {fg = c.yellow},
        ALEVirtualTextInfo = {fg = c.blue},
        -- WhichKey
        WhichKey = {fg = c.pink, style = "bold"},
        WhichKeyGroup = {fg = c.pink, style = "italic"},
        WhichKeyDesc = {fg = c.blue, style = "bold"},
        WhichKeySeperator = {fg = c.green},
        WhichKeyFloating = {bg = c.bg1},
        WhichKeyFloat = {bg = c.bg1},
        -- LspSaga
        DiagnosticError = {fg = c.red},
        DiagnosticWarning = {fg = c.red},
        DiagnosticInformation = {fg = c.blue},
        DiagnosticHint = {fg = c.cyan},
        DiagnosticTruncateLine = {fg = c.fg},
        LspFloatWinNormal = {bg = c.bg0},
        LspFloatWinBorder = {fg = c.pink},
        LspSagaBorderTitle = {fg = c.cyan},
        LspSagaHoverBorder = {fg = c.gray_alt},
        LspSagaRenameBorder = {fg = c.green},
        LspSagaDefPreviewBorder = {fg = c.green},
        LspSagaCodeActionBorder = {fg = c.blue},
        LspSagaFinderSelection = {fg = c.green},
        LspSagaCodeActionTitle = {fg = c.gray_alt},
        LspSagaCodeActionContent = {fg = c.pink},
        LspSagaSignatureHelpBorder = {fg = c.pink},
        ReferencesCount = {fg = c.pink},
        DefinitionCount = {fg = c.pink},
        DefinitionIcon = {fg = c.blue},
        ReferencesIcon = {fg = c.blue},
        TargetWord = {fg = c.cyan},
        -- BufferLine
        BufferLineIndicatorSelected = {fg = c.green},
        BufferLineFill = {bg = c.bg3},
        -- Sneak
        Sneak = {fg = c.bg0, bg = c.green},
        SneakScope = {bg = c.bg4},
        -- Indent Blankline
        IndentBlanklineChar = {fg = c.disabled},
        IndentBlanklineContextChar = {fg = c.cyan},
        -- Nvim dap
        DapBreakpoint = {fg = c.red},
        DapStopped = {fg = c.green},
        -- Startify
        StartifyNumber = {fg = c.pink},
        StartifySelect = {fg = c.green},
        StartifyBracket = {fg = c.gray},
        StartifySpecial = {fg = c.cyan},
        StartifyVar = {fg = c.blue},
        StartifyPath = {fg = c.blue},
        StartifyFile = {fg = c.green},
        StartifySlash = {fg = c.pink},
        StartifyHeader = {fg = c.pink},
        StartifySection = {fg = c.red},
        StartifyFooter = {fg = c.green},
        -- EasyMotion
        EasyMotionTarget = {fg = c.red, bg = c.none, style = "bold"},
        EasyMotionTarget2First = {fg = c.red, bg = c.none, style = "bold"},
        EasyMotionTarget2Second = {fg = c.red, bg = c.none, style = "bold"},
    }

    for group, parameters in pairs(groups) do
        utils.highlight(group, parameters)
    end
end

M.colorscheme = function()
    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "substrata"

    set_terminal_colors()
    set_groups()
end

return M
