<script setup>
import {Link} from '@inertiajs/vue3'
const props = defineProps({links: Array})

props.links[0].label = '&laquo; Anterior'
props.links[props.links.length -1].label = 'Próximo &raquo;'

</script>

<template>
<div class="flex justify-start mt-2 pt-5 dark:text-gray-300">
  <Link
      v-for="(link, index) in props.links"
      :key="index"
      class="py-1 px-4 rounded-md flex items-center justify-center h-8 leading-tight  text-gray-600 border border-gray-300 hover:bg-blue-800 hover:text-white  dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
      :href="link.url"
      :class="{ 'bg-blue-700 hover:bg-blue-800 dark:bg-blue-700 dark:hover:bg-blue-800 text-white hover:text-white dark:text-white': link.active, 'bg-white dark:bg-gray-800 dark:hover:bg-blue-600': link.active == false }"
      v-html="link.label"
  >
  </Link>
</div>
</template>

<style scoped>

</style>