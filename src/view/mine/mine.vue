<template>
	<div class="wrap">
    <router-view></router-view>    
	</div>
</template>
<script type="text/javascript">
   export default {
     name: 'index',
     data () {
       return {
         msg: '我的',
         isNowPage: true
       }
     }
   }
</script>