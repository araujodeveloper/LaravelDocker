<script setup>

const props = defineProps({
    label: {
        type: String,
        required: true
    },

    type: {
        type: String,
        required: true
    },

    id: {
        type: String,
    },

    onclick: {
        type: String,
    },

});

</script>

<template>
    <button :type="type" @click="onclick"
        class="flex gap-1 px-3 py-2 text-sm font-medium text-white bg-blue-700 border border-blue-300 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg mr-2 mb-2 dark:bg-blue-800 dark:text-white dark:border-blue-600 dark:hover:bg-blue-700 dark:hover:border-blue-600 dark:focus:ring-blue-700">
        {{ label }}
        <slot></slot>
    </button>
</template>