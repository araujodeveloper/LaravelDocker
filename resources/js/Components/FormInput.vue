<script setup>
import { computed } from 'vue';
import { vMaska } from "maska";

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
    onlyNumbers: {
        type: Boolean,
        default: false,
    },
    onlyLetters: {
        type: Boolean,
        default: false,
    },
    class: {
        type: String,
        required: false,
        default: 'input-bg-gray-50',
    },
    mask: {
        type: String,
        required: false,
        default: '',
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


function charFilter(evt) {

    if (props.onlyNumbers) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if (/^[0-9,. ]+$/.test(evt.key)) return true;
        else evt.preventDefault();
    } else if (props.onlyLetters) {
        evt = (evt) ? evt : window.event;
        if (/^[A-Za-zçÇ,. ]+$/.test(evt.key)) return true;
        else evt.preventDefault();
    } else {
        return true;
    }

}

</script>

<template>
    <label v-if="label" :for="id" class="block mb-2 text-sm text-gray-900 dark:text-white font-bold">{{ label }}</label>
    <input :type="type" :id="id" :name="name" :disabled="disabled" aria-describedby="helper-text-explanation"
        :value="modelValue" v-model="inputValue" :class="class" :placeholder="placeholder" @keypress="charFilter(event)" v-maska :data-maska="mask">
    <p v-if="helperText" :id="`helper-text-${id}`" class="mt-2 text-sm text-gray-500 dark:text-gray-400">{{ helperText }}
    </p>
</template>