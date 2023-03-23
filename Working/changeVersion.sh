#!/bin/bash
###
# @Author: 480814177 480814177@qq.com
# @Date: 2023-03-23 22:48:24
# @LastEditors: 480814177 480814177@qq.com
# @LastEditTime: 2023-03-24 00:03:41
# @FilePath: /DevOps/changeVersion.sh
# @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
###

# 提示用户输入文件所在的路径
echo "请输入文件所在的路径: "
read filepath
echo "你输入的文件路径是: $filepath"

# 使用 find 命令查找指定文件夹下所有以 .pbxproj 为后缀的文件
echo "查找到的 .pbxproj 文件有: "
files=$(find "$filepath" -name "*.pbxproj")
echo "$files"

# 遍历查找到的所有文件
for file in $files; do
    # 输出正在修改的文件名
    echo "正在修改文件: $file"

    # 获取并输出当前版本号
    currentversion=$(grep "MARKETING_VERSION = [^;]*" "$file" | sed "s/MARKETING_VERSION = \([^;]*\)/\1/")
    echo "当前版本号为: $currentversion"
done

# 提示用户输入要修改的新版本号
echo "请输入要修改的新版本号: "
read newversion
echo "你输入的新版本号是: $newversion"

# 遍历查找到的所有文件
for file in $files; do
    # 输出正在修改的文件名
    echo "正在修改文件: $file"

    # 使用 sed 命令将每个文件中的 MARKETING_VERSION 值修改为用户输入的新版本号
    sed -i '' "s/MARKETING_VERSION = [^;]*/MARKETING_VERSION = $newversion/" "$file"

    # 检查是否成功修改了 MARKETING_VERSION 值，并输出相应信息
    if grep -q "MARKETING_VERSION = $newversion" "$file"; then
        echo "成功修改了 $file 中的 MARKETING_VERSION 值"
    else
        echo "未能成功修改 $file 中的 MARKETING_VERSION 值"
    fi
done

# 输出“修改完成”
echo "修改完成!"
