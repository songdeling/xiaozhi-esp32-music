# ESP-IDF 环境设置脚本
$env:IDF_PATH = "C:\Espressif\frameworks\esp-idf-v5.5.1"
$env:IDF_PYTHON_ENV_PATH = "C:\Espressif\python_env\idf5.5_py3.11_env"

# 添加 Python、CMake 和 Ninja 到 PATH
$env:PATH = "$env:IDF_PYTHON_ENV_PATH\Scripts;$env:PATH"
# 添加 CMake
$cmakePath = "C:\Espressif\tools\cmake\3.30.2\bin"
if (Test-Path $cmakePath) {
    $env:PATH = "$cmakePath;$env:PATH"
}
# 添加 Ninja
$ninjaPath = "C:\Espressif\tools\ninja\1.12.1"
if (Test-Path $ninjaPath) {
    $env:PATH = "$ninjaPath;$env:PATH"
}
# 添加 ESP32-S3 工具链
$toolchainPath = "C:\Espressif\tools\xtensa-esp-elf\esp-14.2.0_20241119\xtensa-esp-elf\bin"
if (Test-Path $toolchainPath) {
    $env:PATH = "$toolchainPath;$env:PATH"
}

# 检查并创建缺失的约束文件目录
$espressifDir = "$env:USERPROFILE\.espressif"
if (-not (Test-Path $espressifDir)) {
    New-Item -ItemType Directory -Path $espressifDir -Force | Out-Null
}

# 检查约束文件，如果不存在则从 IDF_PATH 复制或创建
$constraintsFile = "$espressifDir\espidf.constraints.v5.5.txt"
if (-not (Test-Path $constraintsFile)) {
    # 尝试从 IDF_PATH 查找约束文件
    $idfConstraints = Get-ChildItem "$env:IDF_PATH" -Filter "*constraints*.txt" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($idfConstraints) {
        Copy-Item $idfConstraints.FullName $constraintsFile -Force
        Write-Host "Copied constraints file to $constraintsFile"
    } else {
        # 创建一个基本的约束文件
        "# ESP-IDF v5.5 constraints" | Out-File $constraintsFile -Encoding UTF8
        Write-Host "Created basic constraints file at $constraintsFile"
    }
}

Write-Host "ESP-IDF environment configured"
Write-Host "IDF_PATH: $env:IDF_PATH"
Write-Host "Python: $env:IDF_PYTHON_ENV_PATH\Scripts\python.exe"

