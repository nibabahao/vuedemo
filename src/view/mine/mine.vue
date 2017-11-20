<template>
	<div class="wrap">
    <router-view></router-view>    
	</div>
</template>
<script type="text/javascript">
   import axios from 'axios'
   export default {
     name: 'index',
     data () {
       return {
         msg: '我的',
         isNowPage: true
       }
     },
     beforeCreate () {
       axios.get('/sigin').then(res => {
         if (res.data.username) {
           this.$router.push({path: 'person'})
         } else {
           this.$router.push({path: 'login'})
         }
       })
     }
   }
</script>