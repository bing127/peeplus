import { constantRouterMap } from '@/config/router.config'
import { BasicLayout, RouteView, BlankLayout, PageView } from '@/layouts'

// 前端路由表
const constantRouterComponents = {
  BasicLayout: BasicLayout,
  BlankLayout: BlankLayout,
  RouteView: RouteView,
  PageView: PageView,
  analysis: () => import('@/views/dashboard/Analysis'),
  workplace: () => import('@/views/dashboard/Workplace'),
  menu: () => import('@/views/sys/Menu')
}

// 404页面
const noFound = {
  path: '*', redirect: '/404', hidden: true
}

/**
 * 格式化 后端 结构信息并递归生成层级路由表
 *
 * @param routerMap
 * @param parent
 * @returns {*}
 */
export const generator = (routerMap, parent) => {
  return routerMap.map(item => {
    const currentRouter = {
      // 路由地址 动态拼接生成如 /dashboard/workplace
      path: `${parent && parent.path || ''}/${item.name}`,
      // 路由名称，建议唯一
      name: item.alias || '',
      // 该路由对应页面的 组件
      component: constantRouterComponents[item.layout],
      // meta: 页面标题, 菜单图标, 页面权限(供指令权限用，可去掉)
      meta: { title: item.alias, icon: item.icon || undefined, keepAlive: item.keep, permission: item.permission && [ item.permission ] || null, actions: item.actionList }
    }
    // 为了防止出现后端返回结果不规范，处理有可能出现拼接出两个 反斜杠
    currentRouter.path = currentRouter.path.replace('//', '/')
    // 重定向
    if (item.id === '1') {
      item.redirect = '/dashboard/center'
    }
    // 是否有子菜单，并递归处理
    if (item.children && item.children.length > 0) {
      // Recursion
      currentRouter.children = generator(item.children, currentRouter)
    }
    return currentRouter
  })
}

const permission = {
  state: {
    routers: constantRouterMap,
    addRouters: []
  },
  mutations: {
    SET_ROUTERS: (state, routers) => {
      state.addRouters = [routers, noFound]
      state.routers = constantRouterMap.concat(routers)
    }
  },
  actions: {
    GenerateRoutes ({ commit }, data) {
      return new Promise(resolve => {
        const { roles } = data
        const routers = generator(roles.permissions)
        const json = {
          path: '/',
          name: 'index',
          component: BasicLayout,
          meta: { title: '首页' },
          redirect: '/dashboard/center',
          children: routers
        }
        commit('SET_ROUTERS', json)
        resolve()
      })
    }
  }
}

export default permission
