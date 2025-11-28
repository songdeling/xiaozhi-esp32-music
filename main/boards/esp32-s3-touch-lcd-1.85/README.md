# 微雪 ESP32-S3-Touch-LCD-1.85

## 简介

微雪电子 ESP32-S3-Touch-LCD-1.85 开发板

产品链接：
https://www.waveshare.net/shop/ESP32-S3-Touch-LCD-1.85.htm

## 编译配置命令

### 前置要求

- 已安装 ESP-IDF SDK 5.4 或以上版本
- 已配置 ESP-IDF 环境变量

如果还没有安装 ESP-IDF，请参考：
https://docs.espressif.com/projects/esp-idf/zh_CN/latest/esp32s3/get-started/linux-macos-setup.html

### 编译步骤

.\setup_idf_env.ps1; python "$env:IDF_PATH\tools\idf.py" build


$env:IDF_PATH = "C:\Espressif\frameworks\esp-idf-v5.5.1"; $env:PATH = "C:\Espressif\python_env\idf5.5_py3.11_env\Scripts;C:\Espressif\tools\cmake\3.30.2\bin;C:\Espressif\tools\ninja\1.12.1;C:\Espressif\tools\xtensa-esp-elf\esp-14.2.0_20241119\xtensa-esp-elf\bin;$env:PATH"; python -m esptool --chip esp32s3 merge_bin -o build\merged_firmware.bin -f raw --fill-flash-size 16MB 0x0 build\bootloader\bootloader.bin 0x8000 build\partition_table\partition-table.bin 0xd000 build\ota_data_initial.bin 0x10000 build\srmodels\srmodels.bin 0x100000 build\xiaozhi.bin

**1. 设置编译目标为 ESP32S3：**

```bash
idf.py set-target esp32s3
```

**2. 打开 menuconfig 配置：**

```bash
idf.py menuconfig
```

**3. 选择板子类型：**

在配置界面中，导航到：
```
Xiaozhi Assistant -> Board Type -> Waveshare ESP32-S3-Touch-LCD-1.85
```

按 `S` 保存，按 `Q` 退出。

**4. 编译：**

```bash
idf.py build
```

**5. 烧录（可选）：**

```bash
idf.py flash
```

**6. 监控串口输出（可选）：**

```bash
idf.py monitor
```

或者一次性执行编译、烧录和监控：

```bash
idf.py build flash monitor
```