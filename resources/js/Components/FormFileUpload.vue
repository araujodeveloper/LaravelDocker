<script setup>
import { ref, onMounted } from 'vue';

const props = defineProps({
    label: {
        type: String,
        required: true
    },
    id: {
        type: String,
        required: true
    },
    modelValue: {
        type: Object,
        required: true,
    },
    class: {
        type: String,
        required: false,
        default: 'input-bg-gray-50',
    },
    name: {
        type: String,
        required: true,
    },
    helperText: String,
});

defineEmits(['update:modelValue', 'onchange'])

</script>

<template>
    <div class="">
        <label class="block mb-2 text-sm text-gray-900 dark:text-white font-bold" :for="id">{{ label }}</label>
        <input @input="$emit('update:modelValue', $event.target.files[0])"
            @change="$emit('onchange', $event.target.files[0])" :class="class" :id="id" :name="name" type="file">
        <div class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="user_avatar_help">{{ helperText }}</div>
    </div>
</template>