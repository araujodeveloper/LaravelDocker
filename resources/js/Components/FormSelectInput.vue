<script setup>

const props = defineProps({
    label: String,
    type: {
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
    class: {
        type: String,
        required: false,
        default: 'input-bg-gray-50',
    },
    modelValue: {
        type: String,
        required: true,
    },
    options: {
        type: Array,
        required: true
    },
});

defineEmits(['update:modelValue'])

</script>

<template>
    <label v-if="label" :for="id" class="block mb-2 text-sm text-gray-900 dark:text-white font-bold">{{ label }}</label>
    <select :id="id" :name="name" :value="modelValue" @input="$emit('update:modelValue', $event.target.value)"
        :class="class">
        <option selected disabled>Selecione</option>
        <option v-for="option in options" :value="option['valor']">{{ option['label'] }}</option>
    </select>
</template>