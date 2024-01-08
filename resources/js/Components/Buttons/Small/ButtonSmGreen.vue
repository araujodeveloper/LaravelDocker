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
        class="flex gap-1 px-3 py-2 text-sm font-medium text-white bg-green-700 border border-green-300 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300 rounded-lg mr-2 mb-2 dark:bg-green-800 dark:text-white dark:border-green-600 dark:hover:bg-green-700 dark:hover:border-green-600 dark:focus:ring-green-700">
        {{ label }}
        <slot></slot>
    </button>
</template>