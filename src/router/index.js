import Vue from 'vue'
import Router from 'vue-router'
import Index from '../view/index/index'
import Vip from '../view/vip/vip'
import Catagory from '../view/catagory/catagory'
import Cart from '../view/cart/cart'
import Mine from '../view/mine/mine'
import Address from '../view/address/address'
import City from '../view/address/city'
import Search from '../view/search/search'
import hotSearch from '../view/search/hotSearch'
import noResult from '../view/search/noResult'
import Result from '../view/search/result'
import Goods from '../view/goods/goods'
import goodsList from '../view/goods/goodslist'
import pDetail from '../view/goods/pdetail'
import fDetail from '../view/goods/fdetail'
import Login from '../view/mine/login'
import Signin from '../view/mine/Signin'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '*',
      redirect: '/index'
    },
    {
      path: '/index',
      name: 'Index',
      component: Index
    },
    {
      path: '/vip',
      name: 'Vip',
      component: Vip
    },
    {
      path: '/catagory',
      name: 'Catagory',
      component: Catagory
    },
    {
      path: '/cart',
      name: 'Cart',
      component: Cart
    },
    {
      path: '/mine',
      name: 'Mine',
      component: Mine,
      children: [
        {
          path: '*',
          redirect: '/'
        },
        {
          path: '/',
          name: 'Login',
          component: Login
        },
        {
          path: '/signin',
          name: 'Signin',
          component: Signin
        }
      ]
    },
    {
      path: '/address',
      name: 'Address',
      component: Address
    },
    {
      path: '/city',
      name: 'City',
      component: City
    },
    {
      path: '/search',
      name: 'Search',
      component: Search,
      children: [
        {
          path: '*',
          redirect: '/hotSearch'
        },
        {
          path: '/hotSearch',
          name: 'hotSearch',
          component: hotSearch
        },
        {
          path: '/noResult',
          name: 'noResult',
          component: noResult
        },
        {
          path: '/result',
          name: 'Result',
          component: Result
        }
      ]
    },
    {
      path: '/goods',
      name: 'Goods',
      component: Goods,
      children: [
        {
          path: '*',
          redirect: '/goodslist'
        },
        {
          path: '/goodslist',
          name: 'goodsList',
          component: goodsList
        },
        {
          path: '/pdetail',
          name: 'pDetail',
          component: pDetail
        },
        {
          path: '/fdetail',
          name: 'fDetail',
          component: fDetail
        }
      ]
    }
  ],
  scrollBehavior (to, from, savedPosition) {
    return {x: 0, y: 0}
  },
  beforeEach (to, from, next) {
    console.log(to, from)
    next(function () {
      console.log(11221)
    })
  }
})
