import Vue from 'vue';
import Vuex from 'vuex';
import VueFlashMessage from 'vue-flash-message';

import animals from './modules/animals.module'

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    animals,
    VueFlashMessage
  }
})

