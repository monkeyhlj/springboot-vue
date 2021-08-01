<template>
	<el-form style="width: 420px;" :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm" >
	  <el-form-item label="图书编号">
	  		<el-input v-model="ruleForm.id" readOnly></el-input>
	  </el-form-item>
	  <el-form-item label="图书名称" prop="name">
		<el-input v-model="ruleForm.name"></el-input>
	  </el-form-item>
	  <el-form-item label="作者" prop="author">
	  		<el-input v-model="ruleForm.author"></el-input>
	  </el-form-item>
	  <el-form-item>
		<el-button type="primary" @click="submitForm('ruleForm')">修改</el-button>
		<el-button @click="resetForm('ruleForm')">重置</el-button>
	  </el-form-item>
	</el-form>
</template>
<script>
  import axios from 'axios'
  export default {
    data() {
      return {
        ruleForm: {
			id:'',
			name: '',
			author:''
        },
        rules: {
          name: [
            { required: true, message: '图书名称不能为空', trigger: 'blur' }
          ],
		  author: [
		    { required: true, message: '作者姓名不能为空', trigger: 'blur' }
		  ]
        }
      };
    },
    methods: {
      submitForm(formName) {
		const that = this;
        this.$refs[formName].validate((valid) => {
          if (valid) {
            //alert('校验通过!');
			console.log(that.ruleForm)
			axios.put('http://localhost:8181/book/updateshu',that.ruleForm).then(function(resp){
				console.log(resp)
				if(resp.data == 'success'){
					//alert('添加成功！')
					//that.$message('添加成功!')
					that.$alert('《'+that.ruleForm.name+'》修改成功！', '消息提示', {
						confirmButtonText: '确定',
						callback: action => {
							that.$router.push('/pageOne')
						}
					});
				}
			})
          }else{
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    },
	created(){
		//alert(this.$route.query.id)
		const that = this
		axios.get('http://localhost:8181/book/findById/'+this.$route.query.id).then(function(resp){
			that.ruleForm = resp.data
		})
	}
  }
</script>

<style>
</style>
