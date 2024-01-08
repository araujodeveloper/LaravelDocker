<script setup>
import { computed } from 'vue';

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

    modelValue: {
        type: String,
        required: true,
    },

    required: {
        type: Boolean,
        required: true,
    },
    class: {
        type: String,
        required: false,
        default: 'input-bg-gray-50',
    },
    disabled: Boolean,
    placeholder: String,
    helperText: String,
});

const emit = defineEmits(['update:modelValue'])

const inputValue = computed({
    get() {
        return props.modelValue
    },

    set(newValue) {
        emit('update:modelValue', newValue)
    }
})

</script>

<template>
    <label v-if="label" :for="id" class="block mb-2 text-sm font-bold text-gray-900 dark:text-white">{{ label }}</label>
    <textarea rows="4" :id="id" :name="name" :disabled="disabled" aria-describedby="helper-text-explanation" :class="class"
        :placeholder="placeholder" v-model="inputValue">{{ modelValue }}</textarea>


    <p v-if="helperText" :id="`helper-text-${id}`" class="mt-2 text-sm text-gray-500 dark:text-gray-400">{{ helperText }}
    </p>
</template>