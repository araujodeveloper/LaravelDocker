<script setup>

const props = defineProps({
    label: {
        type: String,
        required: true
    },
    id: {
        type: String,
        required: true
    },
    name: {
        type: String,
        required: true,
    },
    value: {
        type: String,
        required: true
    }
});

</script>

<template>
    <div class="flex items-center mb-4">
        <input :id="id" type="checkbox" :value="value" :name="name"
            class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
        <label :for="id" class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{ label }}</label>
    </div>
</template>