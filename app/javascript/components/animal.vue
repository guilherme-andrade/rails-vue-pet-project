<template>
  <el-card style="marginBottom: 1rem;">
    <el-row :gutter="20" type="flex" align="center" justify="space-between" :span="6">
      <el-col :span="3">
        <router-link v-bind:to="animal.url">
          {{animal.id}} - {{animal.name}}
        </router-link>
      </el-col>
      <el-col :span="3">
        <el-button type="danger" v-on:click="onDelete(animal.id)" circle size="small" icon="el-icon-delete">
        </el-button>
      </el-col>
    </el-row>
  </el-card>
</template>

<script>
  import _ from 'lodash';
  import { DELETE_ANIMAL } from '../store/actions.type';

  export default {
    name: "animal",
    props: ["animal"],
    methods: {
      onDelete(id) {
        this.$store
        .dispatch(DELETE_ANIMAL, id)
        .then(response => {
          if (!!response) {
            this.$notify({
              title: _.capitalize(response.type),
              message: response.message,
              type: response.type
            });
          }
        })
      }
    }
  }
</script>
