# ms-ra-forwarder-for-ifreetime
从 ms-ra-forwarder fork 这个项目的初衷是为了能够在爱阅书香中听“晓晓”念书。

由于原项目不支持爱阅书香，所以想要把原项目和 [iranee/ifreetime](https://github.com/iranee/ifreetime) 结合一下，并且写了一篇教程。

结果大佬 [@justnsms](https://t.me/justnsms) 出现在了群里，并且写了这个项目对比原项目所有新增和改变的代码，非常感谢

在大佬的帮助下，现在不再需要 [iranee/ifreetime](https://github.com/iranee/ifreetime) 项目和php环境，即可通过爱阅书香听书。
## 部署

建议看我的博客文章上的详细步骤来部署，README.md 中只会提供过程概要

[vercel部署版](https://blog.yfi.moe/post/ifreetime-mstts-vercel/)

[自建docker版](https://blog.yfi.moe/post/ifreetime-mstts-selfhost/)

### 部署到vercel
需要token

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fyy4382%2Fms-ra-forwarder-for-ifreetime&env=TOKEN&project-name=ms-ra-forwarder-for-ifreetime&repository-name=ms-ra-forwarder-for-ifreetime)

不需要token

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2Fyy4382%2Fms-ra-forwarder-for-ifreetime&project-name=ms-ra-forwarder-for-ifreetime&repository-name=ms-ra-forwarder-for-ifreetime)

### docker

```bash
docker run -d \
  --name ifreetimeTTS \
  -p 3000:3000 \
  --restart unless-stopped \
  -e TOKEN=example \ #可选
  yunfinibol/ms-ra-forwarder-for-ifreetime:latest

```

### docker compose

```yaml

version: '3'

services:
  ifreetimeTTS:
    container_name: ifreetimeTTS
    image: yunfinibol/ms-ra-forwarder-for-ifreetime:latest
    restart: unless-stopped
    ports:
      - "3000:3000"
    # 如果可以保持自己的ip或者完整域名不公开的话，可以不用设置环境变量
    environment: []
    #需要的话把上边一行注释，下面两行取消注释
    #environment: 
    #  - TOKEN=自定义TOKEN
```

## 爱阅配置：
见我的博客：

[vercel部署版](https://blog.yfi.moe/post/ifreetime-mstts-vercel/)

[自建docker版](https://blog.yfi.moe/post/ifreetime-mstts-selfhost/)

> [!NOTE]
> 为了防止误操作（比如点击了原项目的部署按钮），所以原项目 README.md 请前往 [原项目](https://github.com/wxxxcxx/ms-ra-forwarder) 查看
