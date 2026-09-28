有两种办法，建议先试第一种（快），不行再用第二种（保底）。
方法一：分享链接（最快）
把这一整行复制到 Windows 那台机器上：
vless://c9749809-86bb-4696-8b5b-8e2eafc83acf@64.176.54.179:443?encryption=none&flow=xtls-rprx-vision&security=reality&sni=www.yahoo.co.jp&fp=chrome&pbk=TycXeln2m4IseXYKyQYywDGN9X0oD6I4HMb2ROAxNRI&sid=028bf357c57b9cfa&type=tcp#Vultr-JP
在 Windows 的 Clash Verge 里：订阅页 → 把链接粘进"订阅文件链接"那个框 → 看"导入"按钮是否变亮 → 点导入。如果它认这个格式，会直接生成一个配置，然后你到「代理」页选中它就行。
你的 Clash Verge 版本如果不认分享链接（那个框只接受订阅 URL），就走方法二。
方法二：新建本地配置（一定能成）
1. Clash Verge → 订阅 → 右上角 新建
2. 名称填 jp，类型选「本地 / Local」（不是远程 Remote，那个才要填订阅链接）
3. 创建后选中它 → 点右侧 「⋯」→「编辑文件」
4. 编辑器里全选删掉，粘贴下面全部内容：
proxies:
  - name: Vultr-JP
    type: vless
    server: 64.176.54.179
    port: 443
    uuid: c9749809-86bb-4696-8b5b-8e2eafc83acf
    network: tcp
    tls: true
    udp: true
    flow: xtls-rprx-vision
    servername: www.yahoo.co.jp
    client-fingerprint: chrome
    reality-opts:
      public-key: TycXeln2m4IseXYKyQYywDGN9X0oD6I4HMb2ROAxNRI
      short-id: 028bf357c57b9cfa

proxy-groups:
  - name: Proxy
    type: select
    proxies:
      - Vultr-JP
      - DIRECT

rules:
  - GEOIP,CN,DIRECT
  - MATCH,Proxy
5. 保存 → 「代理」页选中 Proxy 组里的 Vultr-JP
粘贴后检查一行：servername: www.yahoo.co.jp 必须是干净的域名。有些聊天/输入法会把域名自动变成 [www.yahoo.co.jp](http://...) 这种链接形式——你这台 Mac 上就踩过一次这个坑，如果变成那样，手动改回来。
然后两步收尾
打开系统代理：Clash Verge 首页 → 网络设置 → 系统代理 → 打开。
验证：Windows 浏览器访问 ip.sb，出口 IP 显示 64.176.54.179 就成了。
两点提醒
Windows 那台默认会全局走这个节点。 我给的规则是"国内 IP 直连、其余走代理"，日常够用。如果那台机器也想用你的机场订阅享受优化线路，就把机场订阅也加上，再用跟 Mac 上一样的办法（扩展脚本）把自建节点合并进去、做兜底——需要的话我再帮你写一份 Windows 版的。
这段配置里含你的节点密钥，等于一条通道的钥匙。别发到群里或贴到公开地方，用微信/邮件发给自己那台机器就行。


2:20
