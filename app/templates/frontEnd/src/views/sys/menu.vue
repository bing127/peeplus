<template>
    <page-view :title="false">
      <div>
        <a-card :bordered="false">
    <div class="table-page-search-wrapper">
      <a-form layout="inline">
        <a-row :gutter="48">
          <a-col :md="8" :sm="24">
            <a-form-item label="ID">
              <a-input placeholder="请输入" v-model="queryParam.id"/>
            </a-form-item>
          </a-col>
          <a-col :md="8" :sm="24">
            <a-form-item label="别名">
              <a-input placeholder="请输入" v-model="queryParam.alias"/>
            </a-form-item>
          </a-col>
          <a-col :md="8" :sm="24">
            <span class="table-page-search-submitButtons">
              <a-button type="primary" @click="search">查询</a-button>
              <a-button style="margin-left: 8px" @click="reset">重置</a-button>
            </span>
          </a-col>
        </a-row>
      </a-form>
    </div>

    <s-table :columns="columns" :data="loadData" rowKey="id" ref="table">
      <span slot="actions" slot-scope="text, record">
        <a-tag v-for="(action, index) in record.actionList" :key="index">{{ action.describe }}</a-tag>
      </span>

      <span slot="icon" slot-scope="record">
        1
      </span>

      <span slot="action" slot-scope="text, record">
        <a @click="handleEdit(record)">编辑</a>
        <a-divider type="vertical" />
        <a-dropdown>
          <a class="ant-dropdown-link">
            更多 <a-icon type="down" />
          </a>
          <a-menu slot="overlay">
            <a-menu-item>
              <a href="javascript:;">详情</a>
            </a-menu-item>
            <a-menu-item>
              <a href="javascript:;">禁用</a>
            </a-menu-item>
            <a-menu-item>
              <a href="javascript:;">删除</a>
            </a-menu-item>
          </a-menu>
        </a-dropdown>
      </span>
    </s-table>

    <a-modal
      title="操作"
      :width="800"
      v-model="visible"
      @ok="handleOk"
    >
      <a-form :autoFormCreate="(form)=>{this.form = form}">

        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="ID"
          hasFeedback
          validateStatus="success"
        >
          <a-input placeholder="id" v-model="mdl.id" id="no" disabled="disabled" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="别名"
          hasFeedback
          validateStatus="success"
        >
           <a-input placeholder="别名" v-model="mdl.alias" id="permission_alias" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="名称"
          hasFeedback
          validateStatus="success"
        >
          <a-input placeholder="名称" v-model="mdl.name" id="permission_name" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="图标"
          hasFeedback
          validateStatus="success"
        >
          <a-input placeholder="图标" v-model="mdl.icon" id="permission_icon" />
        </a-form-item>
        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="组件"
          hasFeedback
          validateStatus="success"
        >
          <a-input placeholder="组件" v-model="mdl.layout" id="permission_layout" />
        </a-form-item>

        <a-divider />

        <a-form-item
          :labelCol="labelCol"
          :wrapperCol="wrapperCol"
          label="赋予权限"
          hasFeedback
        >
          <a-select
            style="width: 100%"
            mode="multiple"
            v-model="mdl.actionList"
            :allowClear="true"
          >
            <a-select-option v-for="(action, index) in permissionList" :key="index" :value="action.value">{{ action.label }}</a-select-option>
          </a-select>
        </a-form-item>

      </a-form>
    </a-modal>

  </a-card>
      </div>
    </page-view>
</template>

<script>
import { PageView } from '@/layouts'
import { STable } from '@/components'
import { totree } from '@/utils/util'
export default {
  name: 'Menu',
  components: {
    PageView,
    STable
  },
  data () {
    return {
      menu_id: '',
      menu_alias: '',
      visible: false,
      labelCol: {
        xs: { span: 24 },
        sm: { span: 5 }
      },
      wrapperCol: {
        xs: { span: 24 },
        sm: { span: 16 }
      },
      form: null,
      mdl: {},

      // 高级搜索 展开/关闭
      advanced: false,
      // 查询参数
      queryParam: {
        id: '',
        alias: ''
      },
      // 表头
      columns: [
        {
          title: 'ID',
          dataIndex: 'id'
        },
        {
          title: '别名',
          dataIndex: 'alias'
        },
        {
          title: '名称',
          dataIndex: 'name'
        },
        {
          title: '图标',
          dataIndex: 'icon',
          scopedSlots: { customRender: 'icon' }
        },
        {
          title: '组件',
          dataIndex: 'layout'
        },
        {
          title: '可操作权限',
          dataIndex: 'actionList',
          scopedSlots: { customRender: 'actions' }
        },
        {
          title: '操作',
          width: '150px',
          dataIndex: 'action',
          scopedSlots: { customRender: 'action' }
        }
      ],
      // 向后端拉取可以用的操作列表
      permissionList: null,
      // 加载数据方法 必须为 Promise 对象
      loadData: parameter => {
        return this.$http.get('/menu/list', {
          params: Object.assign(parameter, this.queryParam)
        }).then(res => {
          const result = res.result
          result.data.map(permission => {
            permission.actionList = JSON.parse(permission.actions)
            return permission
          })
          result.data = totree(result.data)
          return result
        })
      },

      selectedRowKeys: [],
      selectedRows: []
    }
  },
  filters: {
    statusFilter (status) {
      const statusMap = {
        1: '正常',
        2: '禁用'
      }
      return statusMap[status]
    }
  },
  created () {
    this.loadPermissionList()
  },
  methods: {
    loadPermissionList () {
      // permissionList
      new Promise(resolve => {
        const data = [
          { label: '新增', value: 'add', defaultChecked: false },
          { label: '查询', value: 'get', defaultChecked: false },
          { label: '修改', value: 'update', defaultChecked: false },
          { label: '列表', value: 'query', defaultChecked: false },
          { label: '删除', value: 'delete', defaultChecked: false },
          { label: '导入', value: 'import', defaultChecked: false },
          { label: '导出', value: 'export', defaultChecked: false }
        ]
        setTimeout(resolve(data), 1500)
      }).then(res => {
        this.permissionList = res
      })
    },
    handleEdit (record) {
      console.log(JSON.stringify(record))
      this.mdl = Object.assign({}, record)
      this.visible = true
    },
    handleOk () {

    },
    onChange (selectedRowKeys, selectedRows) {
      this.selectedRowKeys = selectedRowKeys
      this.selectedRows = selectedRows
    },
    toggleAdvanced () {
      this.advanced = !this.advanced
    },
    search () {
      this.$refs.table.loadData()
    },
    reset () {
      this.queryParam.alias = ''
      this.queryParam.id = ''
      this.$refs.table.refresh()
    }
  }
}
</script>

<style scoped>

</style>
