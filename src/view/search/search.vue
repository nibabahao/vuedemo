<template>
	<div class="wrap">
      <headers :title='title'></headers>
	    <div class="searchbox">
	    	<input type="text" v-model="keyWord" placeholder="输入关键词/商品名称" class="searchInput" @keydown="search">
	    </div>
	    <router-view></router-view>
    	<footer-nav :class="{'isIndex':isNowPage}"></footer-nav>		
	</div>
</template>
<script type="text/javascript">
   import FooterNav from '../../components/footer'
   import Headers from '../../components/header'
   export default {
     data () {
       return {
         isNowPage: true,
         title: '搜索',
         keyWord: ''
       }
     },
     components: {
       FooterNav,
       Headers
     },
     methods: {
       search (e) {
         if (e.keyCode === 13) {
           if (this.keyWord !== '') {
             this.$router.push({path: 'result', query: {keyWord: this.keyWord}})
           } else {
             this.$router.push({path: 'noResult', query: {keyWord: this.keyWord}})
           }
         }
       }
     }
   }
</script>
<style type="text/css">
	.wrap{ min-height: 100vh; }
  .searchbox{margin-top: .768rem;}
	.searchbox .searchInput{ width: 6.05rem; height: .68rem;line-height: 1;border:1px solid #d9d9d9;font-size: .256rem;color: #8e8e8e;border-radius: 40px;box-sizing: border-box;padding: 0 0 0 .85rem;margin-top: .18rem;background: url(../../assets/search.png) no-repeat;background-size: .33rem .33rem; background-position: .34rem center;background-color: #FFF;}
</style>