# 使用标准库
use std/util "path add"

# 获取当前用户的 Home 目录
let home = $env.HOME

# 批量添加路径 (顺序：越靠后的优先级越高)
[
    "/run/current-system/sw/bin",
    "/nix/var/nix/profiles/default/bin",
    "/opt/homebrew/bin",
    "/opt/homebrew/sbin",
    $"($home)/.cargo/bin",
    $"($home)/.local/bin",
    $"($home)/.nix-profile/bin" # 补充常见的 Nix per-user 路径
] | each { |it| if ($it | path exists) { path add $it } }
