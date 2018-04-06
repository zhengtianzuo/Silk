
![](https://github.com/zhengtianzuo/zhengtianzuo.github.io/blob/master/images/menuLogoBack.png?raw=true)

# Silk
Silk丝绸平台:
IM即时通讯平台, **非开源**, 采用自主研发的分布式存储应用与UDP/TCP可靠P2P网络传输技术, 自主研发的IM通讯协议, 覆盖主流平台(Win, Android, IOS, Mac, Linux, WP), 插件式高扩展性, OpenGL渲染高流畅UI, 支持集成Web应用, 可以私有化部署, 公有云部署, 简易部署.

![](https://img.shields.io/badge/%E7%89%88%E6%9D%83%E8%AE%B8%E5%8F%AF-MIT-orange.svg)
![](https://img.shields.io/badge/Qt-5.10-blue.svg)
![](https://img.shields.io/badge/VS-2017-blue.svg)
![](https://img.shields.io/badge/QtQuick-2.2-blue.svg)
![](https://img.shields.io/badge/%E7%89%88%E6%9C%AC-1.0.0.0-blue.svg)
![](https://img.shields.io/badge/%E7%BC%96%E8%AF%91-%E6%88%90%E5%8A%9F-brightgreen.svg)


这款产品我是从2013年开始开发至今, 从底层一步一步搭建起来的.
产品的技术文档, 产品文档, 美工图, 测试方案, 测试文档, 技术调研, 功能开发, 运维部署方案, 均由我独立完成.

##### 技术特点:
***
* 自主研发的分布式数据存储中间件, 可以方便快捷的搭建和部署基于分布式存储应用的云端系统, 轻松实现跨区域分布式存储系统.
* 自主研发的点对点可靠网络传输中间件, 可以搭建P2P网络平台系统, 轻松实现音视频会议中心, 直播, 远程桌面/文档演示等功能.
* 基于上面两个核心中间件, 搭建出来的丝绸服务器和客户端, 作为消息, 文件, 业务应用, 均能应对自如.

##### 产品特点:
***
1. P2P
    基于UDP/TCP协议的内网穿透解决方案.

2. 消息必达
    绝不丢消息, 要么在客户端, 要么在服务器. 而且可以随时控制每包数据是否允许丢失, 比如视频播放中的P帧, B帧是可以丢失的.

    解决丢包：采用自行研发的并行滑动窗口协议，保证数据的稳定可靠传输。
    动态调整：数据通讯可行效率动态评估和计算获得当前环境下的最佳通讯表现。
    数据组帧：通讯数据包发送分包，接收组包，保证数据顺序完整。

3. 自主研发的IM通信协议
    由IM业务决定的消息传输协议, 非常强的扩展性, 开发灵活而高效.

4. 分布式存储
    数据通过分布式存储方案, 负载均衡, 业务引流等方式达到服务器应用效能最大化.

5. 覆盖主流平台的跨平台部署方案
    服务器可部署到Win7, Win10, Mac, Ubuntu上, 理论上部署到移动端也是可以的, 哈哈.  客户端可部署到Android, IOS, WP手机或平板上. 已覆盖主流平台.

6. 客户端和服务器均可通过插件化扩展功能
    客户端和服务器除基础功能外, 扩展功能均采用插件式开发, 集成和部署相当方便.

7. 严格软件分层, 保证了流畅的界面, 高效的底层
    基于OpenGL渲染的UI加上严格的分层模式, 流畅度高, 不会出现卡顿, 假死等现象.

8. WebEngine
    可以非常快速的集成Web应用, 和H5特效等.

9. 多种部署方式
    可以私有化部署, 公有云部署, 简易部署.


10. 易维护的代码
    PC客户端, Android客户端, IOS客户端, WP客户端 均采用同一套代码编译而成, 维护和需求变更成本非常低.

##### 后续开发:
***
 1. 音视频通话, 音视频会议, 基于可靠UDP模式下的网络传输中间件, 开发音视频传输是非常容易的事, 只用关心采集和编解码就行了.
 2. 远程桌面, 电子白板 这个同上
 3. 云盘, 基于分布式数据存储中间件, 可在目前C/S网络架构和P2P模式的配合上完成.

##### 产品视频介绍:  丝绸平台项目介绍书
***
http://v.youku.com/v_show/id_XMjkxODcxMzI1Ng==.html

#### 运行截图:
##### PC客户端:
***
![](https://github.com/zhengtianzuo/Silk/blob/master/images/win/pc%20(1).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/win/pc%20(2).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/win/pc%20(3).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/win/pc%20(4).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/win/pc%20(5).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/win/pc%20(6).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/win/pc%20(7).png?raw=true)

##### Android客户端:
***
![](https://github.com/zhengtianzuo/Silk/blob/master/images/android/android%20(1).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/android/android%20(2).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/android/android%20(3).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/android/android%20(4).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/android/android%20(5).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/android/android%20(6).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/android/android%20(7).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/android/android%20(8).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/android/android%20(9).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/android/android%20(10).png?raw=true)

##### 中心端服务器:
***
![](https://github.com/zhengtianzuo/Silk/blob/master/images/win/pc%20(8).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/win/pc%20(9).png?raw=true)

##### 数据库服务器:
***
![](https://github.com/zhengtianzuo/Silk/blob/master/images/win/pc%20(10).png?raw=true)

![](https://github.com/zhengtianzuo/Silk/blob/master/images/win/pc%20(11).png?raw=true)



#### 应用实例:
***
SilkZipSplitter: Silk Zip文件分割器

![](https://github.com/zhengtianzuo/Silk/blob/master/SilkZipSplitter/show.gif?raw=true)


SilkInstaller: Silk 安装程序

![](https://github.com/zhengtianzuo/Silk/blob/master/SilkInstaller/show.gif?raw=true)


#### 计划加入的工程:
***
1. SilkConfig: Silk配置管理程序


#### 联系方式:
***
|作者|郑天佐|
|---|---
|QQ|278969898
|主页|http://www.camelstudio.cn/
|邮箱|camelsoft@163.com
|博客|http://blog.csdn.net/zhengtianzuo06/
|github|https://github.com/zhengtianzuo
|QQ群|199672080|![](https://github.com/zhengtianzuo/zhengtianzuo.github.io/blob/master/qqgroup.jpg?raw=true)





***
#### **捐赠**
<img src="https://github.com/zhengtianzuo/zhengtianzuo.github.io/blob/master/weixin.jpg?raw=true" width="30%" height="30%" />           <img src="https://github.com/zhengtianzuo/zhengtianzuo.github.io/blob/master/zhifubao.jpg?raw=true" width="30%" height="30%" />

###### 觉得分享的内容还不错, 就请作者喝杯咖啡吧~~
***