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
        class="flex gap-1 px-3 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-200 rounded-lg mr-2 mb-2 dark:bg-gray-800 dark:text-white dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700">
        {{ label }}
        <slot></slot>
    </button>
</template>