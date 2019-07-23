export function timeFix () {
  const time = new Date()
  const hour = time.getHours()
  return hour < 9 ? '早上好' : hour <= 11 ? '上午好' : hour <= 13 ? '中午好' : hour < 20 ? '下午好' : '晚上好'
}

export function welcome () {
  const arr = ['休息一会儿吧', '准备吃什么呢?', '要不要打一把 DOTA', '我猜你可能累了']
  const index = Math.floor(Math.random() * arr.length)
  return arr[index]
}

/**
 * 触发 window.resize
 */
export function triggerWindowResizeEvent () {
  const event = document.createEvent('HTMLEvents')
  event.initEvent('resize', true, true)
  event.eventType = 'message'
  window.dispatchEvent(event)
}

export function handleScrollHeader (callback) {
  let timer = 0

  let beforeScrollTop = window.pageYOffset
  callback = callback || function () {}
  window.addEventListener(
    'scroll',
    event => {
      clearTimeout(timer)
      timer = setTimeout(() => {
        let direction = 'up'
        const afterScrollTop = window.pageYOffset
        const delta = afterScrollTop - beforeScrollTop
        if (delta === 0) {
          return false
        }
        direction = delta > 0 ? 'down' : 'up'
        callback(direction)
        beforeScrollTop = afterScrollTop
      }, 50)
    },
    false
  )
}

/**
 * Remove loading animate
 * @param id parent element id or class
 * @param timeout
 */
export function removeLoadingAnimate (id = '', timeout = 1500) {
  if (id === '') {
    return
  }
  setTimeout(() => {
    document.body.removeChild(document.getElementById(id))
  }, timeout)
}

/**
 *
 * @param {Array} metadata 元数据
 * @param {String} id 父标识字段名
 * @param {String} pid 子标识字段名
 */
export function totree (metadata, id, pid, children) {
  id = id || 'id'
  pid = pid || 'parent_id'
  children = children || 'children'
  if (!metadata || metadata.length <= 0) {
    return []
  }
  var map = toMap(metadata, pid)
  var arr = []
  var rootIndex
  for (const k in map) {
    arr.push(k)
  }
  rootIndex = Math.min.apply(Math, arr)
  return findNodes(map[rootIndex], map, id, children)
}

function toMap (metadata, pid) {
  var map = {}
  metadata.map((val, index) => {
    if (!map.hasOwnProperty(val[pid])) {
      map[val[pid]] = [val]
    } else {
      map[val[pid]].push(val)
    }
  })
  return map
}

function findNodes (arr, map, id, children) {
  arr.map(function (val, index) {
    if (map[val[id]]) {
      //  存在子节点
      val[children] = map[val[id]]
      findNodes(val[children], map, id, children)
    }
  })
  return arr
}
