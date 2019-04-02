<template>
  <div>
    <h1>{{animalsCount}}</h1>
    <animal v-for="animal in animals" :animal="animal"></animal>
    <animal-form></animal-form>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex';
  import animal from '../components/animal'
  import animalForm from '../components/animal-form'
  import { FETCH_ANIMALS } from '../store/actions.type';

  export default {
    name: 'animals',
    components: {
      animal,
      animalForm
    },
    computed: {
      ...mapGetters(['animalsCount', 'isLoading', 'animals'])
    },
    mounted() {
      this.fetchAnimals();
    },
    methods: {
      fetchAnimals() {
        this.$store.dispatch(FETCH_ANIMALS);
      },
    }
  }
</script>
