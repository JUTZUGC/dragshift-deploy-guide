# DragShift 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/llamaboi55/DragShift#readme
# 更新日期：2026-10-31
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -fL -o DragShift-Setup.exe https://github.com/llamaboi55/DragShift/releases/latest/download/DragShift-Setup.exe
Write-Host "已下载 DragShift-Setup.exe：双击安装，仅装当前用户，不需要管理员权限"

Write-Host ''

Write-Host '下载与校验完成，安装包在 .download 目录'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/llamaboi55/DragShift#readme'
