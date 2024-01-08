<script setup>

const props = defineProps({
    title: {
        type: String,
        required: true
    },

    width: {
        type: String,
        required: true,
        default: "18"
    },

    height: {
        type: String,
        required: true,
        default: "18"
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
    <span :title="title" >
        <svg xmlns="http://www.w3.org/2000/svg" :width="width" :height="height" viewBox="0 0 24 24" fill="none" stroke="currentColor"
        stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye">
        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
        <circle cx="12" cy="12" r="3"></circle>
    </svg>
</span>
</template>

