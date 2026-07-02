# MW2019 (IW8) LUI / Lua Dumps

Decompiled **LUI** front-end Lua source for *Call of Duty: Modern Warfare (2019)* — engine **IW8** — across three retail Battle.net builds.

The game ships its UI as stripped **LuaJIT 2.1** bytecode packed inside fastfiles. These dumps were extracted from the running game and decompiled back to readable `.lua` for reference, diffing, and reverse-engineering.

## Versions

| Folder | Build | Files |
| --- | --- | --- |
| `1.24 Bnet/` | 1.24 (Battle.net) | ~1,650 |
| `1.64.5 Bnet/` | 1.64.5 (Battle.net) | ~1,977 |
| `1.69 Bnet/` | 1.69.0 (Battle.net) | ~1,988 |

## Layout

Each version folder mirrors the game's virtual chunk tree:

```
<version> Bnet/
├── _manifest.tsv      # every chunk: name, size, kind, first-4-bytes magic
├── luashared/         # shared runtime Lua
└── ui/                # LUI front-end
    ├── codcaster/
    ├── frontEnd/      # menus, blades, layouts (the bulk of the tree)
    ├── inGame/
    ├── requires/
    ├── uiEditor/
    ├── utils/         # LUI core (LUI.lua, TweenProperty, etc.)
    └── widgets/       # reusable UI elements
```

## Notes

- **Auto-generated names.** Bytecode is stripped of local/argument names, so the decompiler emits placeholders like `arg_1_0`, `arg_2_1`, etc. Global names, method names, and string literals survive intact, so the code is fully readable — just not pretty. Decompiled with [luajit-decompiler-v2](https://github.com/Aussiemon/luajit-decompiler-v2).
- **`_manifest.tsv`** lists every original chunk. All entries are LuaJIT bytecode (magic `1B 4C 4A 02`).
- **Failed decompiles** are kept as raw bytecode with a `.FAILED.luac` suffix (e.g. `1.24 Bnet/ui/frontEnd/MainMenuBladeLayout.FAILED.luac`) so nothing is silently dropped.
- **Cross-version diffing** is the main use case — dropping the same file path from two folders into a diff tool shows exactly what Infinity Ward changed to the menu/UI logic between patches.

## Disclaimer

For educational and reverse-engineering research only. All game code and assets are the property of **Activision / Infinity Ward**. No copyrighted binaries or fastfiles are included — only decompiled Lua text. Not affiliated with or endorsed by Activision.
