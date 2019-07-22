<h1 align="center">peeplus 后台管理系统</h1>

![peeplus Release][version-image] ![peeplus License][Release-image]

[version-image]: https://img.shields.io/badge/peeplus-MIT-brightgreen.svg
[Release-image]: https://img.shields.io/badge/peeplus-V1.0.1-brightgreen.svg


- 项目说明
> 1、基于flask和vue打造的前后端分离项目
> 2、前后端只依赖于token
> 3、前端vue动态路由

- 前端项目路径: ~@/app/templates/frontEnd
- 后端路径:~@/app


Overview
----

![工作台-多标签模式](https://static-2.loacg.com/open/static/github/20190224163345.jpg)

前端环境和依赖
----

- node
- yarn
- webpack
- eslint
- @vue/cli ~3
> 请注意，我们强烈建议本项目使用 [Yarn](https://yarnpkg.com/) 包管理工具，这样可以与本项目演示站所加载完全相同的依赖版本 (yarn.lock) 。由于我们没有对依赖进行强制的版本控制，采用非 yarn 包管理进行引入时，可能由于 Pro 所依赖的库已经升级版本而引入了新版本所导致的问题。作者可能会由于时间问题无法及时排查而导致您采用本项目作为基项目而出现问题。


后端端环境和依赖
----

- python3.7
- flask
- flask-script
- flask-socketio
- flask-sqlalchemy
- numpy
- flask-debugtoolbar
- mysqlclient
- flask-cors
- pyjwt
- flask-sqlacodegen


项目下载和运行
----

- 拉取项目代码
```bash
git clone https://gitee.com/null_897_5856/peeplus.git peeplus
cd peeplus
```

- 安装依赖
- 前端
```
cd peeplus/app/templates/frontEnd
yarn install
```

- 后端

```
pipenv shell
pipenv install/sync
```


- 开发模式运行
```
前端:yarn run serve
```
```
后端:
pipenv shell (激活虚拟环境)
python manager.py runserver (启动项目)
```

- 编译项目
```
cd peeplus/app/templates/frontEnd
yarn run build
```


其他说明
----

- **使用polyfill兼容至 IE10**

- **更多pipenv命令可查看pipenv -h**

- **sql文件在db目录**


## Contributors

<a href="https://github.com/sendya/ant-design-pro-vue/graphs/contributors"><img src="https://avatar.gitee.com/uploads/24/1041324_null_897_5856.png!avatar100?1563787639" /></a>

