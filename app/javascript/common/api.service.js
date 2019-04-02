import Vue from "vue";
import axios from "axios";
import VueAxios from "vue-axios";
import { API_URL } from "./config";
import VueResource from 'vue-resource';


const ApiService = {
  init() {
    Vue.use(VueAxios, axios, VueResource);
    Vue.axios.defaults.baseURL = API_URL;
  },

  query(resource, params) {
    return Vue.axios.get(resource, params)
    .catch(error => {
      throw new Error(`[RWV] ApiService ${error}`);
    });
  },

  index(resource) {
    return Vue.axios.get(`${resource}?format=json`)
    .catch(error => {
      throw new Error(`[RWV] ApiService ${error}`);
    });
  },

  get(resource, id = "") {
    return Vue.axios.get(`/${resource}/${id}?format=json`)
    .catch(error => {
      throw new Error(`[RWV] ApiService ${error}`);
    });
  },

  post(resource, params) {
    return Vue.axios.post(`/${resource}?format=json`, params);
  },

  update(resource, id, params) {
    return Vue.axios.put(`/${resource}/${id}?format=json`, params);
  },

  put(resource, params) {
    return Vue.axios.put(`/${resource}?format=json`, params);
  },

  delete(resource) {
    return Vue.axios.delete(`/${resource}?format=json`)
  }
};

export default ApiService;


export const AnimalsService = {
  get(id = "") {
    // if (typeof id !== "integer") {
    //   throw new Error(
    //     "[RWV] CommentsService.get() article id required to fetch comments"
    //   );
    // }
    return ApiService.get("animals", `${id}`);
  },

  index() { return ApiService.get("animals") },

  post(params) {
    return ApiService.post(`animals`, { animal: params });
  },

  delete(id) {
    return ApiService.delete(`animals/${id}`);
  }
};
