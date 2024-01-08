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
    checked: {
        type: Boolean,
        required: true
    },
    value: {
        type: String,
        required: true,
    },
});

</script>



<template>
    <div class="flex items-center mb-4">
        <input :id="id" type="radio" :name="name" :value="value"
            class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600"
            :checked="checked">
        <label :for="id" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
            {{ label }}
        </label>
    </div>
</template>