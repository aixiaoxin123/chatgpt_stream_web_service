#chatgpt流式调用，前端实现打印机效果
本项目为后端项目，与前端项目搭配使用，（本人公众号：AI小新）
![image](aixiaoxin.png)

前端项目地址：https://github.com/aixioaxin/chatgpt_stream_web_front


## 前置要求

### Node

`node` 需要 `^16 || ^18 || ^19` 版本（`node >= 14` 需要安装 [fetch polyfill](https://github.com/developit/unfetch#usage-as-a-polyfill)），使用 [nvm](https://github.com/nvm-sh/nvm) 可管理本地多个 `node` 版本

```shell
node -v
```



### 填写密钥
获取 `Openai Api Key` 或 `accessToken` 并填写本地环境变量 [跳转](#介绍)

```
# .env 文件

# OpenAI API Key - https://platform.openai.com/overview
OPENAI_API_KEY=


```

## 本地部署安装

1、根目录运行以下命令，安装pnpm

```
npm install pnpm -g
```

2、根目录运行以下命令,安装依赖包
```
pnpm install
```
3、测试环境运行

```
pnpm start
```
4、运行地址

http://localhost:3002/



## 环境变量

`API` 可用：

- `OPENAI_API_KEY` 和 `OPENAI_ACCESS_TOKEN` 二选一
- `OPENAI_API_MODEL`  设置模型，可选，默认：`gpt-3.5-turbo`
- `OPENAI_API_BASE_URL` 设置接口地址，可选，默认：`https://api.openai.com`

`ACCESS_TOKEN` 可用：

- `OPENAI_ACCESS_TOKEN`  和 `OPENAI_API_KEY` 二选一，同时存在时，`OPENAI_API_KEY` 优先
- `API_REVERSE_PROXY` 设置反向代理，可选，默认：`https://bypass.churchless.tech/api/conversation`，[社区](https://github.com/transitive-bullshit/chatgpt-api#reverse-proxy)（注意：只有这两个是推荐，其他第三方来源，请自行甄别）

通用：

- `AUTH_SECRET_KEY` 访问权限密钥，可选
- `MAX_REQUEST_PER_HOUR` 每小时最大请求次数，可选，默认无限
- `TIMEOUT_MS` 超时，单位毫秒，可选
- `SOCKS_PROXY_HOST` 和 `SOCKS_PROXY_PORT` 一起时生效，可选
- `SOCKS_PROXY_PORT` 和 `SOCKS_PROXY_HOST` 一起时生效，可选
- `HTTPS_PROXY` 支持 `http`，`https`, `socks5`，可选
- `ALL_PROXY` 支持 `http`，`https`, `socks5`，可选


## 利用docker部署

### 使用 Docker

#### Docker 参数示例

![docker](./docs/docker.png)

#### Docker build & Run

```bash
docker build -t chatgpt-web-service .



# 后台运行
docker run --name chatgpt-web-service -d -p 0.0.0.0:3002:3002 --env OPENAI_API_KEY=your_api_key chatgpt-web-service

# 运行地址
http://localhost:3002/
```



## 常见问题


Q: 文件保存时全部爆红?

A: `vscode` 请安装项目推荐插件，或手动安装 `Eslint` 插件。

Q: 前端没有打字机效果？

A: 一种可能原因是经过 Nginx 反向代理，开启了 buffer，则 Nginx 会尝试从后端缓冲一定大小的数据再发送给浏览器。请尝试在反代参数后添加 `proxy_buffering off;`，然后重载 Nginx。其他 web server 配置同理。




## License
MIT © [aixiaoxin]
本人公众号：AI小新

参考原项目地址：https://github.com/Chanzhaoyu/chatgpt-web/