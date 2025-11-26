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