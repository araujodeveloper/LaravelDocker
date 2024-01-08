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
        class="flex gap-1 px-3 py-2 text-sm font-medium text-white bg-yellow-400 border border-yellow-300 hover:bg-yellow-500 focus:ring-4 focus:outline-none focus:ring-yellow-300 rounded-lg mr-2 mb-2 dark:bg-yellow-800 dark:text-white dark:border-yellow-600 dark:hover:bg-yellow-700 dark:hover:border-yellow-600 dark:focus:ring-yellow-700">
        {{ label }}
        <slot></slot>
    </button>
</template>