<script setup>

const props = defineProps({
    label: {
        type: String,
        required: false
    },
    classe: {
        type: String,
        required: true
    },
});

</script>
<template>
    <div class="">
        <span :class="classe">{{ label }}</span>
    </div>
</template>

<style scoped></style>