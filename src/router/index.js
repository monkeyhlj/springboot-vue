import Vue from 'vue'
import Router from 'vue-router'
import PageOne from '@/components/PageOne'
import PageTwo from '@/components/PageTwo'
import PageThree from '@/components/PageThree'
import PageFour from '@/components/PageFour'
//import App from '../App'
import Index from '@/components/index'
import Updateshu from '@/components/updateshu'

Vue.use(Router)

const routes = [
	{
	  path:'/',
	  name:'图书管理',
	  component: Index,
		show:true,
		redirect:'/pageOne',
		children:[
			{
			  path:'/pageOne',
			  name:'查询图书',
			  component: PageOne
			},
			{
			  path:'/pageTwo',
			  name:'添加图书',
			  component: PageTwo
			}
		]
	},
	{
		path:'/updateshu',
		component:Updateshu,
		show:false
	}
	/* {
	  path: '/navigation',
	  name: '导航2',
	  component: Index,
		children:[
			{
			  path:'/pageThree',
			  name:'页面3',
			  component: PageThree
			},
			{
			  path:'/pageFour',
			  name:'页面4',
			  component: PageFour
			} 
		]
	}*/
]

const router = new Router({
	mode:'history',
	base:process.env.BASE_URL,
	routes
})

export default router
