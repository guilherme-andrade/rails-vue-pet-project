<template>
  <el-form :model="animal" ref="animal-form">
    <el-row>
      <el-col span="12">
        <el-form-item>
          <el-input v-model="animal.name" placeholder="animal name" v-on:change="onChange('name', $event);"></el-input>
          <el-tag v-if="animal.errors.name" type="danger">
            {{`name ${animal.errors.name[0]}`}}
          </el-tag>
        </el-form-item>
      </el-col>
      <el-col span="6" offset="2">
        <el-form-item>
          <el-button type="primary" @click="onSubmit()">Create Animal</el-button>
        </el-form-item>
      </el-col>
    </el-row>
  </el-form>
</template>

<script>
  import { UPDATE_FIELD } from '../store/mutations.type';
  import { CREATE_ANIMAL } from '../store/actions.type';
  import { mapGetters } from 'vuex';

  export default {
    name: "animal-form",

    computed: {
      ...mapGetters(['animal'])
    },

    methods: {
      onChange(field, value) {
        this.$store
        .commit(UPDATE_FIELD, { field, value })
      },
      onSubmit() {
        this.$store
        .dispatch(CREATE_ANIMAL)
        .then(flash => {
          if (!!flash) {
            this.$notify({
              title: _.capitalize(flash.type),
              message: flash.message,
              type: flash.type
            });
          }
        })
      }
    }
    // mounted() {
    //   this.fetchAnimals();
    // }
    // ,
    // methods: {
    //   fetchAnimals() {
    //     this.$store.dispatch(FETCH_ANIMALS);
    //   },
    // }
  }
</script>
