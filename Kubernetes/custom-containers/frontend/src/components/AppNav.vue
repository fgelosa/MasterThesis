
<template>
  <nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse fixed-top" style="background-color:#133862 !important;">
    <a class="navbar-brand" href="#">Master Thesis Frontend</a>
    <ul class="navbar-nav mr-auto">
      <li class="nav-item" v-show="isAdmin()">
        <a class="btn btn-success mr-sm-2" href="#/admin">Admin</a>
      </li>
    </ul>

    <ul class="navbar-nav">
      <li class="nav-item" v-show="!isLoggedIn()">
        <a class="btn btn-success mr-sm-2" style="background-color: #7ba9fa  !important; border-color: #133862 !important;" href="#/login">Login</a>
      </li>
      <li class="nav-item" v-show="isLoggedIn()">
        <button class="btn mr-sm-2" style="background-color: #7ba9fa  !important; border-color: #133862 !important; color:white !important;" href="#" @click="logout()" >Logout</button>
      </li>
    </ul>
  </nav>

</template>

<script>

import Auth from '@/auth'

export default {
  name: 'app-nav',

  methods: {
    logout () {
      Auth.logout()
    },
    isLoggedIn () {
      return Auth.isLoggedIn()
    },
    isAdmin () {
      return Auth.isAdmin()
    }
  }
}
</script>