#!/bin/bash

# echo "请输入用户名:"
# read -r username

# echo "请输入密码:"
# read -r password

read -p "请输入 GitHub 用户名: " username
read -p "请输入 GitHub 密码: " -s password

echo

# 使用cURL工具发送 HTTP POST 请求

# -d 表示使用application/x-www-form-urlencoded 对数据进行编码
response=$(curl -s -H "Content-Type: application/json" -X POST -d '{"scopes":["repo"],"note":"Github 登录"}' "https://github.com/login" --user "$username:$password")

# 解析返回的json数据

if [ $(echo "$response" | jq -r '.id') ]; then
    echo "Github 登录成功，返回数据如下："
    echo "response data:$response"
else

    echo "Github 登录失败，errpr：$response"

fi
