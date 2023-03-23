#!/bin/bash
###
# @Author: 480814177 480814177@qq.com
# @Date: 2023-03-10 12:24:41
# @LastEditors: 480814177 480814177@qq.com
# @LastEditTime: 2023-03-23 13:11:49
# @FilePath: /DevOps/shell/test.sh
# @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
###

# 读取输入的参数
AGENTID=$1
CMDID=$2
COUNT=$3
TARNAME=$4
INX=$5

# 读取输入的用户名和密码
read -p "请输入用户名: " USERNAME
read -p "请输入密码: " PASSWORD

# 这里可以添加自己的逻辑
INX=$(expr $INX + 1)

# 发送post请求，并将结果保存到result.txt文件中
curl --connect-timeout 100 -m 100 "httpurl" -X POST -H "Content-Type:application/json" -d ' {"id":"'$AGENTID'","cmdId":"'$CMDID'","count":"'$COUNT'","tarName":"'$TARNAME'","inx":"'$INX'","username":"'$USERNAME'","password":"'$PASSWORD'"}' >result.txt

# 输出result.txt文件中的内容
cat result.txt
