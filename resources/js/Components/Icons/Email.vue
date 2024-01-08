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
        required: false,
    },

});

</script>

<template>
    <span :title="title">       
        <svg xmlns="http://www.w3.org/2000/svg" :width="width" :height="height" viewBox="0 0 24 24" fill="none" 
        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
        class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z">
        </path>
        <polyline points="22,6 12,13 2,6">
        </polyline>
    </svg>
    </span>
    </template>



