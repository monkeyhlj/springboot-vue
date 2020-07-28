<template>
 <div>
  <el-table
    :data="tableData"
		border
    style="width: 570px">
    <el-table-column
      prop="id"
      label="编号"
      width="150">
    </el-table-column>
    <el-table-column
      prop="name"
      label="书名"
      width="150">
    </el-table-column>
	<el-table-column
	  prop="author"
	  label="作者"
	  width="150">
	</el-table-column>
    <el-table-column
      label="操作"
      width="120">
      <template slot-scope="scope">
        <el-button @click="editshu(scope.row)" type="text" size="small">修改</el-button>
        <el-button @click="deleteshu(scope.row)" type="text" size="small">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
  <el-pagination
	  background
	  layout="prev, pager, next"
	  :page-size="pageSize"
	  :total="total"
	  @current-change="page">
  </el-pagination>
 </div> 
</template>

<script>
	import axios from 'axios'
	  export default {
		methods: {
			deleteshu(row){
				//alert(row.id)
				const that = this
				axios.delete('http://localhost:8181/book/deleteById/'+row.id).then(function(resp){
					that.$alert('《'+row.name+'》删除成功！', '消息提示', {
						confirmButtonText: '确定',
						callback: action => {
							//that.$router.push('/pageOne') 本来就是在这个界面，只需要刷新
							window.location.reload()
						}
					});
				})
			},
		  editshu(row) {
				this.$router.push({
						path:"/updateshu",
						query:{
							id:row.id
						}
				})
				//console.log(row);
		  },
		  page(currentPage){
			  //alert(currentPage);
			 /* switch(currentPage){
				  case 1:
					this.tableData = [
						{
						  id: '1',
						  name: '解忧杂货店',
						  author: '东野圭吾'
						},
						{
						  id: '2',
						  name: '解忧杂货店2',
						  author: '东野圭吾2'
						},
						{
						  id: '3',
						  name: '解忧杂货店3',
						  author: '东野圭吾3'
						}
					]
					break;
				  case 2:
					this.tableData = [
						{
						  id: '4',
						  name: '解忧杂货店',
						  author: '东野圭吾'
						},
						{
						  id: '5',
						  name: '解忧杂货店2',
						  author: '东野圭吾2'
						},
						{
						  id: '6',
						  name: '解忧杂货店3',
						  author: '东野圭吾3'
						}
					]
					break;
			  } */
			const that = this
			axios.get('http://localhost:8181/book/findAll/'+(currentPage-1)+'/6').then(function(resp){
				//console.log(resp)
				that.tableData = resp.data.content
				that.pageSize = resp.data.size 
				that.total = resp.data.totalElements
			})	
		  }
		},

		data() {
		  return {
			pageSize:'2',
			total:'12',  
			tableData: [
				/* {
				  id: '1',
				  name: '解忧杂货店',
				  author: '东野圭吾'
				},
				{
				  id: '2',
				  name: '解忧杂货店2',
				  author: '东野圭吾2'
				},
				{
				  id: '3',
				  name: '解忧杂货店3',
				  author: '东野圭吾3'
				} */
			]
		  }
		},
		
		created(){
			const that = this
			axios.get('http://localhost:8181/book/findAll/0/6').then(function(resp){
				console.log(resp)
				that.tableData = resp.data.content
				that.pageSize = resp.data.size 
				that.total = resp.data.totalElements
			})
		}
	  }
</script>