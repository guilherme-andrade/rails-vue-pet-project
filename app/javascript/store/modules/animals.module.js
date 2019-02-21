import _ from 'lodash';
import { AnimalsService } from "../../common/api.service";
import { FETCH_ANIMALS, CREATE_ANIMAL, DELETE_ANIMAL } from "../actions.type";
import * as mutationTypes from "../mutations.type";

const initialAnimalState = {
  data: {
    id: null,
    url: null,
    name: ''
  },
  errors: {},
  saving: false,
  hasUnsavedChanges: false
}

const state = {
  animals: [],
  isLoading: true,
  animalsCount: 0,
  animal: initialAnimalState
};

const getters = {
  animalsCount(state) {
    return state.animalsCount;
  },
  animals(state) {
    return state.animals;
  },
  isLoading(state) {
    return state.isLoading;
  },
  animal(state) {
    return state.animal
  }
};

const actions = {
  [FETCH_ANIMALS]({ commit }) {
    commit(mutationTypes.FETCH_START);
    return AnimalsService.index()
      .then(({ data, length }) => {
        commit(mutationTypes.FETCH_END, data);
      })
      .catch(error => {
        throw new Error(error);
      });
  },
  [CREATE_ANIMAL]({ commit, state }) {
    commit(mutationTypes.POST_PENDING);
    return AnimalsService.post(state.animal.data)
      .then(({ data }) => {
        commit(mutationTypes.POST_SUCCESS, data);
        commit(mutationTypes.RESET_STATE);
        return {type: 'success', message: `${data.name} created!`};
      })
      .catch(({ response }) => {
        // ["stack", "message", "config", "request", "response"]
        commit(mutationTypes.POST_FAILURE, response.data);
        return {type: 'error', message: 'Please review the problems below'};
      });
  },
  [DELETE_ANIMAL]({ commit }, id) {
    commit(mutationTypes.DELETE_PENDING);
    return AnimalsService.delete(id)
      .then(({ data }) => {
        commit(mutationTypes.DELETE_SUCCESS, id);
        return {type: 'success', message: `${data.name} deleted!`};
      })
      .catch(({ response }) => {
        commit(mutationTypes.DELETE_FAILURE, response.data);
        return {type: 'error', message: response.data};
      })
  }
};

const mutations = {
  [mutationTypes.FETCH_START](state) {
    state.isLoading = true;
  },

  [mutationTypes.FETCH_END](state, animals) {
    state.animals = animals;
    state.animalsCount = animals.length;
    state.isLoading = false;
  },

  [mutationTypes.UPDATE_FIELD](state, { field, value }) {
    state.animal.data[field] = value;
    state.animal.hasUnsavedChanges = true;
  },

  [mutationTypes.POST_PENDING](state) {
    state.animal.saving = true;
  },

  [mutationTypes.POST_SUCCESS](state, payload) {
    state.animal = initialAnimalState;
    state.animals.push(payload);
    state.animalsCount += 1;
  },

  [mutationTypes.POST_FAILURE](state, errors) {
    state.animal.errors = errors;
    state.animal.saving = false;
  },

  [mutationTypes.DELETE_PENDING](state) {
    state.animal.saving = true;
  },

  [mutationTypes.DELETE_SUCCESS](state, id) {
    _.remove(state.animals, animal => animal.id === id);
    state.animals = state.animals
    state.animalsCount -= 1;
  },

  [mutationTypes.DELETE_FAILURE](state, errors) {
    state.animal.errors = errors;
    state.animal.saving = false;
  },

  [mutationTypes.RESET_STATE]() {
    state.animal = {
      data: {
        id: null,
        url: null,
        name: ''
      },
      errors: {},
      saving: false,
      hasUnsavedChanges: false
    }
  }
};

export default {
  state,
  getters,
  actions,
  mutations
};
