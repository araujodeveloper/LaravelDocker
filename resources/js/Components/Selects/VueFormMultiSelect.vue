<template>
    <div>
      <Multiselect
        v-model="value"
        :options="props.options"
      />
    </div>
  </template>
  
  <script setup>
    import Multiselect from '@vueform/multiselect'

    const props = defineProps({
        options: Array,
    });
  </script>
  
  <style src="@vueform/multiselect/themes/default.css"></style>