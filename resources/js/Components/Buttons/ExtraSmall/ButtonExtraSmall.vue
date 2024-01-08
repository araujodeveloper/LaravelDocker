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
    
<button :type="type" @click="onclick" class="button-extra-small">{{ label }}</button>

</template>