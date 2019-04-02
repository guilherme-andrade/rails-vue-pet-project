import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
  mode: 'history',
  routes: [
    {
      path: "/something",
      component: () => import("../views/home"),
    },
    {
      path: "/animals",
      component: () => import("../views/animals")
    },
    {
      path: "/animals/:id",
      component: () => import("../views/animal")
    }
  ]
});
