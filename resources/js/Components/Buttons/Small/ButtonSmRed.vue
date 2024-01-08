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
        class="flex gap-1 px-3 py-2 text-sm font-medium text-white bg-red-700 border border-red-300 hover:bg-red-500 focus:ring-4 focus:outline-none focus:ring-red-300 rounded-lg mr-2 mb-2 dark:bg-red-800 dark:text-white dark:border-red-600 dark:hover:bg-red-700 dark:hover:border-red-600 dark:focus:ring-red-700">
        {{ label }}
        <slot></slot>
    </button>
</template>